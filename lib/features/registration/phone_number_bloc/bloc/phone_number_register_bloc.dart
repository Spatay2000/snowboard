import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:snowboard/core/utils/exceptions.dart';
import 'package:snowboard/domain/usecase/register_phone_number_usecase.dart';
import 'package:snowboard/features/utils/bloc_extension.dart';

part 'phone_number_register_event.dart';
part 'phone_number_register_state.dart';

@injectable
class PhoneNumberRegisterBloc
    extends Bloc<PhoneNumberRegisterEvent, PhoneNumberRegisterState> {
  final RegisterPhoneNumberUseCase registerPhoneNumberUseCase;
  PhoneNumberRegisterBloc(this.registerPhoneNumberUseCase)
      : super(PhoneNumberRegisterInitial()) {
    on<RegisterPhoneNumber>((event, emit) async {
      try {
        emitOneShot(RegisterSendToBackLoading());
        final user = await registerPhoneNumberUseCase
            .call(RegisterPhoneNumberUseCaseParams(
          userId: event.userId,
          phoneNumber: event.phoneNumber,
        ));
        emit(RegisterPhoneNumberSuccess(id: user.userId!));
        log(user.userId.toString());
      } on BaseException catch (e) {
        emitOneShot(RegisterPhoneNumberFailure(message: e.getMessage()));
      }
    });
  }
}

import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:snowboard/core/utils/exceptions.dart';
import 'package:snowboard/domain/usecase/register_usecase.dart';
import 'package:snowboard/features/utils/bloc_extension.dart';

part 'registration_event.dart';
part 'registration_state.dart';

@injectable
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegisterUseCase registerUseCase;
  RegistrationBloc(
    this.registerUseCase,
  ) : super(RegistrationInitial()) {
    on<SignUp>((event, emit) async {
      try {
        emitOneShot(RegisterSendToBackLoading());
        final user = await registerUseCase.call(RegisterUseCaseParams(
            email: event.email,
            fullName: event.fullName,
            password: event.password,
            repeatPassword: event.repeatPassword));
        emit(RegisterSuccess(id: user.userId!));
        log(user.userId.toString());
      } on BaseException catch (e) {
        emitOneShot(RegisterFailure(message: e.getMessage()));
      }
    });
  }
}

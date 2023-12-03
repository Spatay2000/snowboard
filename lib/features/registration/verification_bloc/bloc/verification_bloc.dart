import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:snowboard/core/utils/exceptions.dart';
import 'package:snowboard/domain/usecase/verification_code_usecase.dart';
import 'package:snowboard/features/utils/bloc_extension.dart';

part 'verification_event.dart';
part 'verification_state.dart';

@injectable
class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final VerificationCodeUseCase verificationCodeUseCase;
  VerificationBloc(
    this.verificationCodeUseCase,
  ) : super(VerificationInitial()) {
    on<VerificationCode>((event, emit) async {
      try {
        emitOneShot(RegisterSendToBackLoading());
        final user =
            await verificationCodeUseCase.call(VerificationCodeUseCaseParams(
          userId: event.userId,
          code: event.code,
        ));
        emit(VerificationSuccess(id: user.clientId!));
        log(user.clientId.toString());
      } on BaseException catch (e) {
        emitOneShot(VerificationFailure(message: e.getMessage()));
      }
    });
  }
}

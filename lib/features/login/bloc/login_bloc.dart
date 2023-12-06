
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:snowboard/core/utils/exceptions.dart';
import 'package:snowboard/domain/usecase/login_usecase.dart';
import 'package:snowboard/domain/usecase/shared_preferences/save_token_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase authUsecase;
  final SaveTokenUseCase saveTokenUseCase;

  LoginBloc({
    required this.authUsecase,
    required this.saveTokenUseCase,
  }) : super(LoginInitial()) {
    on<SignIn>((event, emit) async {
      try {
        emit(LoginLoading());
        final user = await authUsecase.call(LoginUseCaseParams(
          email: event.login,
          password: event.passowrd,
          deviceId: 'String',
        ));

        emit(LoginSuccess(
            user.managerResponse!.message!, user.managerResponse!.isSuccess!));
        if (user.managerResponse!.isSuccess! == true) {
          await saveTokenUseCase
              .call(SaveTokenUseCaseParams(token: user.accedToken!));
        }
      } on BaseException catch (e) {
        emit(LoginFailure(e.getMessage()));
      }
    });
  }
}

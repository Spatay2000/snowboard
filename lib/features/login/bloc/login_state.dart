part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginFailure extends LoginState {
  final String message;

  const LoginFailure(this.message);
  @override
  List<Object> get props => [message];
}

class LoginSuccess extends LoginState {
  final String message;
  final bool success;
  const LoginSuccess(this.message, this.success);

  @override
  List<Object> get props => [message, success];
}

class LoginLoading extends LoginState {}

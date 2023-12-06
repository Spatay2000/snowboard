part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class SignIn extends LoginEvent {
  final String login;
  final String passowrd;
 

  const SignIn(
      {required this.login, required this.passowrd, });
  @override 
  List<Object> get props => [login, passowrd,];
}

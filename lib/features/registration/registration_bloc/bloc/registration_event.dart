part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class SignUp extends RegistrationEvent {
  final String email;
  final String fullName;
  final String password;
  final String repeatPassword;

  const SignUp({
    required this.email,
    required this.fullName,
    required this.password,
    required this.repeatPassword,
  });
  @override
  List<Object> get props => [
        email,
        fullName,
        password,
        repeatPassword,
      ];
}

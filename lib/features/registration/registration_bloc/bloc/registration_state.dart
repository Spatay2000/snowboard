part of 'registration_bloc.dart';

sealed class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

final class RegistrationInitial extends RegistrationState {}

class RegisterSuccess extends RegistrationState {
  final String id;

  const RegisterSuccess({required this.id});
}

class RegisterLoading extends RegistrationState {}

class RegisterSendToBackLoading extends RegistrationState {}

class RegisterFailure extends RegistrationState {
  final String message;

  const RegisterFailure({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

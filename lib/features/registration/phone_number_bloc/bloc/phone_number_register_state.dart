part of 'phone_number_register_bloc.dart';

sealed class PhoneNumberRegisterState extends Equatable {
  const PhoneNumberRegisterState();
  
  @override
  List<Object> get props => [];
}

final class PhoneNumberRegisterInitial extends PhoneNumberRegisterState {}

class RegisterPhoneNumberSuccess extends PhoneNumberRegisterState {
  final String id;

  const RegisterPhoneNumberSuccess({required this.id});
}

class RegisterPhoneNumberLoading extends PhoneNumberRegisterState {}

class RegisterSendToBackLoading extends PhoneNumberRegisterState {}

class RegisterPhoneNumberFailure extends PhoneNumberRegisterState {
  final String message;

  const RegisterPhoneNumberFailure({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

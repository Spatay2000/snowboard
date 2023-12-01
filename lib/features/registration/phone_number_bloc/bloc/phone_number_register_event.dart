part of 'phone_number_register_bloc.dart';

abstract class PhoneNumberRegisterEvent extends Equatable {
  const PhoneNumberRegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterPhoneNumber extends PhoneNumberRegisterEvent {
  final String userId;
  final String phoneNumber;

  const RegisterPhoneNumber({
    required this.userId,
    required this.phoneNumber,
  });
  @override
  List<Object> get props => [
        userId,
        phoneNumber,
      ];
}

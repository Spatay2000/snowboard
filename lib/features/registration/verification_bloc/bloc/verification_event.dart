part of 'verification_bloc.dart';

abstract class VerificationEvent extends Equatable {
  const VerificationEvent();

  @override
  List<Object> get props => [];
}

class VerificationCode extends VerificationEvent {
  final String userId;
  final int code;

  const VerificationCode({
    required this.userId,
    required this.code,
  });
  @override
  List<Object> get props => [
        userId,
        code,
      ];
}

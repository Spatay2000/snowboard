part of 'verification_bloc.dart';

sealed class VerificationState extends Equatable {
  const VerificationState();
  
  @override
  List<Object> get props => [];
}

final class VerificationInitial extends VerificationState {}


class VerificationSuccess extends VerificationState {
  final String id;

  const VerificationSuccess({required this.id});
}

class VerificationLoading extends VerificationState {}

class RegisterSendToBackLoading extends VerificationState {}

class VerificationFailure extends VerificationState {
  final String message;

  const VerificationFailure({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

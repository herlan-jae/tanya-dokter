import 'package:equatable/equatable.dart';

abstract class EmailVerificationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SendVerificationPIN extends EmailVerificationEvent {
  final String email;

  SendVerificationPIN({required this.email});

  @override
  List<Object?> get props => [email];
}

class VerifyPIN extends EmailVerificationEvent {
  final String email;
  final String pin;

  VerifyPIN({required this.email, required this.pin});

  @override
  List<Object?> get props => [email, pin];
}

class ResendPIN extends EmailVerificationEvent {
  final String email;

  ResendPIN({required this.email});

  @override
  List<Object?> get props => [email];
}

import 'package:equatable/equatable.dart';

abstract class ResetPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerifyEmailEvent extends ResetPasswordEvent {
  final String email;

  VerifyEmailEvent(this.email);
}

class VerifyPINEvent extends ResetPasswordEvent {
  final String email;
  final String pin;

  VerifyPINEvent(this.email, this.pin);
}

class NewPasswordEvent extends ResetPasswordEvent {
  final String email;
  final String pin;
  final String newPassword;

  NewPasswordEvent(this.email, this.pin, this.newPassword);
}

abstract class ResetPasswordEvent {}

class VerifyEmail extends ResetPasswordEvent {
  final String email;

  VerifyEmail(this.email);
}

class VerifyPIN extends ResetPasswordEvent {
  final String email;
  final String pin;

  VerifyPIN(this.email, this.pin);
}

class NewPassword extends ResetPasswordEvent {
  final String email;
  final String pin;
  final String password;

  NewPassword(this.email, this.pin, this.password);
}

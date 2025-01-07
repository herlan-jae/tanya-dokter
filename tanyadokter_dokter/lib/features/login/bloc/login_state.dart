abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final Map<String, dynamic> userData;

  LoginSuccess(this.userData);
}

class LoginFailed extends LoginState {
  final String error;

  LoginFailed(this.error);
}

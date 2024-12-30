import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final Map<String, dynamic> _userData;

  LoginSuccess(this._userData);

  @override
  List<Object?> get props => [_userData];
}

class LoginFailed extends LoginState {
  final String error;

  LoginFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

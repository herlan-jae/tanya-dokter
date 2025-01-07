import 'package:equatable/equatable.dart';

abstract class ResetPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final String message;

  ResetPasswordSuccess(this.message);
}

class ResetPasswordFailed extends ResetPasswordState {
  final String error;

  ResetPasswordFailed(this.error);
}

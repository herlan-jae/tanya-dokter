import 'package:equatable/equatable.dart';

abstract class EmailVerificationState extends Equatable {

  @override
  List<Object?> get props => [];
}

class EmailVerificationInitial extends EmailVerificationState {}

class EmailVerificationLoading extends EmailVerificationState {}

class EmailVerificationPINSent extends EmailVerificationState {}

class EmailVerificationSuccess extends EmailVerificationState {}

class EmailVerificationFailed extends EmailVerificationState {
  final String error;

  EmailVerificationFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

class ResendPINSuccess extends EmailVerificationState {}

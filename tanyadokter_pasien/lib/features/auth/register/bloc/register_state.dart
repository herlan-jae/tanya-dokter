import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSucces extends RegisterState {
  final Map<String, dynamic> _userData;

  RegisterSucces(this._userData);

  @override
  List<Object?> get props => [_userData];
}

class RegisterFailed extends RegisterState {
  final String error;
  RegisterFailed({required this.error});

  @override
  List<Object?> get props => [error];
}

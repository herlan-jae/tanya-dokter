import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String fullname;
  final String gender;
  final String email;
  final String password;

  RegisterSubmitted({
    required this.fullname,
    required this.gender,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [];
}

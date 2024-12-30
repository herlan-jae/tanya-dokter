import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/login_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc(this.loginRepository) : super(LoginInitial()) {
    on<LoginSubmitted>(
      (event, emit) async {
        emit(LoginLoading());
        try {
          final userData =
              await loginRepository.login(event.email, event.password);
          emit(LoginSuccess(userData));
        } catch (e) {
          emit(LoginFailed(error: e.toString()));
        }
      },
    );
  }
}

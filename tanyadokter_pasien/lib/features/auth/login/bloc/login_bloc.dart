import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/app/session_helper.dart';
import 'package:tanyadokter_pasien/features/auth/login/data/login_custom_exception.dart';
import 'package:tanyadokter_pasien/features/auth/login/data/login_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc(this.loginRepository) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        final userData =
            await loginRepository.login(event.email, event.password);
        await SessionHelper.saveUserSession(userData);
        emit(LoginSuccess(userData));
      } on CustomException catch (e) {
        emit(LoginFailed(error: e.toString()));
      } catch (e) {
        emit(LoginFailed(error: "Terjadi kesalahan tidak dikenal."));
      }
    });

    on<LogoutRequested>((event, emit) async {
      await SessionHelper.clearSession();
      emit(LoginInitial());
    });
  }
}

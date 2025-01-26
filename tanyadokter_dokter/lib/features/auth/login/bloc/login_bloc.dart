import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_dokter/app/session_helper.dart';
import 'package:tanyadokter_dokter/features/auth/login/bloc/login_event.dart';
import 'package:tanyadokter_dokter/features/auth/login/bloc/login_state.dart';
import 'package:tanyadokter_dokter/constant/custom_exception.dart';
import 'package:tanyadokter_dokter/features/auth/login/data/login_repository.dart';

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
        emit(LoginFailed(e.toString()));
      } catch (e) {
        emit(LoginFailed(e.toString()));
      }
    });

    on<LogoutRequested>((event, emit) async {
      emit(LoginLoading());
      await SessionHelper.clearSession();
      emit(LoginInitial());
    });
  }
}

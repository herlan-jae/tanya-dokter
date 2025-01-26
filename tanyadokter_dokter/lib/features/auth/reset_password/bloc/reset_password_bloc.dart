import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_dokter/constant/custom_exception.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/bloc/reset_password_event.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/bloc/reset_password_state.dart';
import 'package:tanyadokter_dokter/features/auth/reset_password/data/reset_password_repository.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordRepository resetPasswordRepository;

  ResetPasswordBloc(this.resetPasswordRepository)
      : super(ResetPasswordInitial()) {
    on<VerifyEmail>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        await resetPasswordRepository.verifyEmail(event.email);
        emit(ResetPasswodSucces("Kode OTP telah dikirimkan ke email Anda"));
      } on CustomException catch (e) {
        emit(ResetPasswordFailed(e.toString()));
      } catch (e) {
        emit(ResetPasswordFailed(e.toString()));
      }
    });

    on<VerifyPIN>((event, emit) async {
      emit(ResetPasswodSucces("Kode OTP Terverifikasi"));
    });

    on<NewPassword>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        await resetPasswordRepository.resetPassword(
            event.email, event.pin, event.password);
        emit(ResetPasswodSucces("Password telah berhasil diperbarui"));
      } on CustomException catch (e) {
        emit(ResetPasswordFailed(e.toString()));
      } catch (e) {
        emit(ResetPasswordFailed(e.toString()));
      }
    });
  }
}

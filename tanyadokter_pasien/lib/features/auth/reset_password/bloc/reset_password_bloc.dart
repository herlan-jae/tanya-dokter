import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanyadokter_pasien/features/auth/reset_password/bloc/reset_password_event.dart';
import 'package:tanyadokter_pasien/features/auth/reset_password/bloc/reset_password_state.dart';
import 'package:tanyadokter_pasien/features/auth/reset_password/data/reset_password_api_service.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordApiService resetPasswordApiService;

  ResetPasswordBloc(this.resetPasswordApiService)
      : super(ResetPasswordInitial()) {
    on<VerifyEmailEvent>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        await resetPasswordApiService.verifyEmail(event.email);
        emit(ResetPasswordSuccess("Kode OTP telah dikirimkan ke email Anda"));
      } catch (e) {
        emit(ResetPasswordFailed(e.toString()));
      }
    });

    on<VerifyPINEvent>((event, emit) async {
      emit(ResetPasswordSuccess("Kode OTP terverifikasi"));
    });

    on<NewPasswordEvent>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        await resetPasswordApiService.resetPassword(
          event.email,
          event.pin,
          event.newPassword,
        );
        emit(ResetPasswordSuccess('Password telah berhasil direset'));
      } catch (e) {
        emit(
          ResetPasswordFailed(e.toString()),
        );
      }
    });
  }
}

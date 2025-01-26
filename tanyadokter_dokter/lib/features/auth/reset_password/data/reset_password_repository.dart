import 'package:tanyadokter_dokter/features/auth/reset_password/data/reset_password_api.dart';

class ResetPasswordRepository {
  final ResetPasswordApiService resetPasswordApiService;

  ResetPasswordRepository(this.resetPasswordApiService);

  Future<void> verifyEmail(String email) async {
    try {
      await resetPasswordApiService.verifyEmail(email);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetPassword(String email, String pin, String password) async {
    try {
      await resetPasswordApiService.resetPassword(email, pin, password);
    } catch (e) {
      rethrow;
    }
  }
}

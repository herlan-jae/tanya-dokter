import 'package:tanyadokter_pasien/features/email_verification/data/email_verification_api_service.dart';

class EmailVerificationRepository {
  final EmailVerificationApiService _emailVerificationApiService;

  EmailVerificationRepository(
      {EmailVerificationApiService? emailVerificationApiService})
      : _emailVerificationApiService =
            emailVerificationApiService ?? EmailVerificationApiService();

  Future<void> sendVerificationPIN(String email) async {
    await _emailVerificationApiService.sendVerificationPIN(email);
  }

  Future<void> verifyPIN(String email, String pin) async {
    await _emailVerificationApiService.verifyPIN(email, pin);
  }

  Future<void> resendPIN(String email) async {
    await _emailVerificationApiService.resendPIN(email);
  }
}

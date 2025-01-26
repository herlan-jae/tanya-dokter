import 'package:dio/dio.dart';
import 'package:tanyadokter_dokter/constant/custom_exception.dart';

class ResetPasswordApiService {
  final Dio dio;

  ResetPasswordApiService(this.dio);

  Future<void> verifyEmail(String email) async {
    try {
      final response = await dio.post(
        'https://tanya-dokter-api.fakhrurcodes.my.id/v1/auth/forgot-password',
        data: {"email": email},
      );
      if (response.statusCode != 200) {
        throw Exception(("Verifikasi Email Gagal"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        switch (e.response?.statusCode) {
          case 400:
            throw CustomException(
                "Email tidak sesuai. Pastikan semua data sudah diisi dengan benar.");
          case 401:
            throw CustomException("Password salah. Silakan coba lagi.");
          case 403:
            throw CustomException(
                "Akun Anda belum terverifikasi. Periksa email Anda untuk verifikasi.");
          case 422:
            throw CustomException(
                "Akun tidak ditemukan. Silakan daftar terlebih dahulu.");
          default:
            throw CustomException("Terjadi kesalahan. Silakan coba lagi.");
        }
      } else {
        throw CustomException(
            "Tidak ada koneksi internet. Periksa jaringan Anda.");
      }
    }
  }

  Future<void> resetPassword(String email, String pin, String password) async {
    try {
      final response = await dio.post(
        'https://tanya-dokter-api.fakhrurcodes.my.id/v1/auth/reset-password',
        data: {
          "email": email,
          "pin": pin,
          "password": password,
        },
      );
      if (response.statusCode != 200) {
        throw Exception(("Reset Password Gagal"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        switch (e.response?.statusCode) {
          case 400:
            throw CustomException(
                "Email tidak sesuai. Pastikan semua data sudah diisi dengan benar.");
          case 401:
            throw CustomException("Password salah. Silakan coba lagi.");
          case 403:
            throw CustomException(
                "Akun Anda belum terverifikasi. Periksa email Anda untuk verifikasi.");
          case 422:
            throw CustomException(
                "Akun tidak ditemukan. Silakan daftar terlebih dahulu.");
          default:
            throw CustomException("Terjadi kesalahan. Silakan coba lagi.");
        }
      } else {
        throw CustomException(
            "Tidak ada koneksi internet. Periksa jaringan Anda.");
      }
    }
  }
}

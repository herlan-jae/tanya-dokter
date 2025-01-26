import 'package:dio/dio.dart';
import 'package:tanyadokter_dokter/constant/custom_exception.dart';

class LoginApiService {
  final Dio dio;

  LoginApiService(this.dio);

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await dio.post(
        'https://tanya-dokter-api.fakhrurcodes.my.id/v1/auth/signin',
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        final data = response.data["data"];
        return {
          "access_token": data["access_token"],
          "id": data["user"]["id"],
          "email": data["user"]["email"],
          "code": data["user"]["code"],
          "fullname": data["user"]["fullname"],
          "phone": data["user"]["phone"],
          "status": data["user"]["status"],
          "gender": data["user"]["gender"],
          "avatar": data["user"]["avatar"],
          "address": data["user"]["address"],
          "village": data["user"]["village"],
          "district": data["user"]["district"],
          "city": data["user"]["city"],
          "province": data["user"]["province"],
          "country": data["user"]["country"],
          "zip_code": data["user"]["zip_code"],
          "category_id": data["user"]["category_id"],
        };
      } else {
        throw Exception("Login Gagal");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        switch (e.response?.statusCode) {
          case 400:
            throw CustomException(
                "Email atau Password salah. Pastikan semua data sudah diisi dengan benar.");
          case 401:
            throw CustomException("Password salah. Silakan coba lagi.");
          case 403:
            throw CustomException(
                "Akun Anda belum terverifikasi. Periksa email Anda untuk verifikasi.");
          case 404:
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

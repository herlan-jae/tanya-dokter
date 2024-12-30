import 'package:dio/dio.dart';

class ResetPasswordApiService {
  final Dio dio;

  ResetPasswordApiService(this.dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('Request: [${options.method}] ${options.uri}');
          print('Headers: ${options.headers}');
          print('Data: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print('Response: ${response.statusCode} ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print('Error: ${e.response?.statusCode} ${e.message}');
          print('Error Data: ${e.response?.data}');
          return handler.next(e);
        },
      ),
    );
  }

  Future<void> verifyEmail(String email) async {
    final response = await dio.post(
      'https://tanya-dokter-api.fakhrurcodes.my.id/v1/auth/forgot-password',
      data: {'email': email},
    );
    if (response.statusCode != 200) {
      throw Exception(response.data['message']);
    }
  }

  Future<void> resetPassword(
      String email, String pin, String newPassword) async {
    final response = await dio.post(
        'https://tanya-dokter-api.fakhrurcodes.my.id/v1/auth/reset-password',
        data: {
          'email': email,
          'pin': pin,
          'new_password': newPassword,
        });
    if (response.statusCode != 200) {
      throw Exception(response.data['message']);
    }
  }
}

import 'package:dio/dio.dart';

class LoginApiService {
  final Dio dio;

  LoginApiService()
      : dio = Dio(BaseOptions(
            baseUrl:
                'https://tanya-dokter-api.fakhrurcodes.my.id/v1/auth/signin')) {
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

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await dio.post(
        'https://tanya-dokter-api.fakhrurcodes.my.id/v1/auth/signin',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response.data;
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'Terjadi kesalahan';
    }
  }
}

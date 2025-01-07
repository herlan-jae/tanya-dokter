import 'package:dio/dio.dart';

class LoginApiService {
  final Dio dio;

  LoginApiService(this.dio) {
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
    final response = await dio.post(
      "https://tanya-dokter-api.fakhrurcodes.my.id/v1/auth/signin",
      data: {"email": email, "password": password},
    );

    if (response.statusCode == 200) {
      final data = response.data["data"];
      return {
        "access_token": data["access_token"],
        "fullname": data["user"]["fullname"],
      };
    } else {
      throw Exception("Login Gagal");
    }
  }
}

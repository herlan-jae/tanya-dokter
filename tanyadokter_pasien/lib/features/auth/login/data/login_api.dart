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
      'https://tanya-dokter-api.fakhrurcodes.my.id/v1/auth/signin',
      data: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      final data = response.data["data"];
      return {
        "access_token": data["access_token"],
        "id": data["user"]["id"],
        "email": data["user"]["email"],
        "fullname": data["user"]["fullname"],
        "phone": data["user"]["phone"],
        "gender": data["user"]["gender"],
        "avatar": data["user"]["avatar"],
        "address": data["user"]["address"],
        "village": data["user"]["village"],
        "district": data["user"]["district"],
        "city": data["user"]["city"],
        "province": data["user"]["province"],
        "country": data["user"]["country"],
        "zip_code": data["user"]["zip_code"],
      };
    } else {
      throw Exception("Login Gagal");
    }
  }
}

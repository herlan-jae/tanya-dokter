import 'package:dio/dio.dart';

class EmailVerificationApiService {
  final Dio dio;

  EmailVerificationApiService()
      : dio = Dio(BaseOptions(
          baseUrl:
              'https://tanya-dokter-api.fakhrurcodes.my.id/v1/auth/email-verification',
        )) {
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

  Future<Response> sendVerificationPIN(String email) async {
    return await dio.post(
      'https://tanya-dokter-api.fakhrurcodes.my.id/v1/auth/email-verification',
      data: {
        'email': email,
      },
    );
  }

  Future<Response> verifyPIN(String email, String pin) async {
    return await dio.post(
      'https://tanya-dokter-api.fakhrurcodes.my.id/v1/auth/email-verification',
      data: {
        'email': email,
        'pin': pin,
      },
    );
  }

  Future<Response> resendPIN(String email) async {
    return await dio.post(
      'https://tanya-dokter-api.fakhrurcodes.my.id/v1/auth/resend-email-verification',
      data: {
        'email': email,
      },
    );
  }
}

import 'login_api.dart';

class LoginRepository {
  final LoginApiService loginApiService;

  LoginRepository(this.loginApiService);

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      return await loginApiService.login(email, password);
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:tanyadokter_dokter/features/login/data/login_api.dart';

class LoginRepository {
  final LoginApiService loginApiService;

  LoginRepository(this.loginApiService);

  Future<Map<String, dynamic>> login(String email, String password) async {
    return await loginApiService.login(email, password);
  }
}

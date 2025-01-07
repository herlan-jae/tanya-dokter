import 'register_api_service.dart';

class RegisterRepository {
  final RegisterApiService registerApiService;

  RegisterRepository(this.registerApiService);

  Future<Map<String, dynamic>> register(
      String fullname, String gender, String email, String password) async {
    return await registerApiService.register(
      fullname,
      gender,
      email,
      password,
    );
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SessionHelper {
  static Future<void> saveUserSession(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString("token", userData["access_token"] ?? "");
    prefs.setString("user_id", userData["id"]?.toString() ?? "");
    prefs.setString("user_data", userData["fullname"] ?? "");
    prefs.setString("phone", userData["phone"] ?? "");
    prefs.setString("gender", userData["gender"] ?? "");
  }

  static Future<Map<String, String?>> getUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    final data = {
      "fullname": prefs.getString("user_data") ?? "",
      "access_token": prefs.getString("token") ?? "",
      "id": prefs.getString("user_id") ?? "",
      "phone": prefs.getString("phone") ?? "",
      "gender": prefs.getString("gender") ?? "",
    };
    return data;
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

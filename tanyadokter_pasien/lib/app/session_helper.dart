import 'package:shared_preferences/shared_preferences.dart';

class SessionHelper {
  static Future<void> saveUserSession(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user_data", userData["fullname"] ?? "");
    prefs.setString("token", userData["access_token"] ?? "");
    prefs.setString("user_id", userData["id"] ?? "");
  }

  static Future<Map<String, String?>> getUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "fullname": prefs.getString("user_data") ?? "",
      "access_token": prefs.getString("token") ?? "",
      "id": prefs.getString("user_id") ?? "",
    };
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

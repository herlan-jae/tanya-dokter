import 'package:shared_preferences/shared_preferences.dart';

class SessionHelper {
  static Future<void> saveUserSession(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("fullname", userData["fullname"] ?? "");
    await prefs.setString("token", userData["access_token"] ?? "");

    if (userData["id"] != null) {
      await prefs.setInt("user_id", userData["id"]);
    }
  }

  static Future<Map<String, dynamic>> getUserSession() async {
    final prefs = await SharedPreferences.getInstance();

    // Check if user_id is stored as String and convert it to int
    final userId = prefs.getString("user_id");
    int? userIdInt;
    if (userId != null) {
      userIdInt = int.tryParse(userId);
    } else {
      userIdInt = prefs.getInt("user_id");
    }

    return {
      "fullname": prefs.getString("fullname") ?? "",
      "access_token": prefs.getString("token") ?? "",
      "user_id": userIdInt,
    };
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

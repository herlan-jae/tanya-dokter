import 'package:shared_preferences/shared_preferences.dart';

class SessionHelper {
  static Future<void> saveUserSession(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        "token",
        userData["access_token"] != null
            ? "Bearer ${userData['access_token']}"
            : "");
    prefs.setString("user_id", userData["id"]?.toString() ?? "");
    prefs.setString("email", userData["email"] ?? "");
    prefs.setString("user_data", userData["fullname"] ?? "");
    prefs.setString("phone", userData["phone"] ?? "");
    prefs.setString("gender", userData["gender"] ?? "");
    prefs.setString("avatar", userData["avatar"] ?? "");
    prefs.setString("address", userData["address"] ?? "");
    prefs.setString("village", userData["village"] ?? "");
    prefs.setString("district", userData["district"] ?? "");
    prefs.setString("city", userData["city"] ?? "");
    prefs.setString("province", userData["province"] ?? "");
    prefs.setString("country", userData["country"] ?? "");
    prefs.setString("zip_code", userData["zip_code"] ?? "");
  }

  static Future<Map<String, String?>> getUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    final data = {
      "access_token": prefs.getString("token") ?? "",
      "id": prefs.getString("user_id") ?? "",
      "email": prefs.getString("email") ?? "",
      "fullname": prefs.getString("user_data") ?? "",
      "phone": prefs.getString("phone") ?? "",
      "gender": prefs.getString("gender") ?? "",
      "avatar": prefs.getString("avatar") ?? "",
      "address": prefs.getString("address") ?? "",
      "village": prefs.getString("village") ?? "",
      "district": prefs.getString("district") ?? "",
      "city": prefs.getString("city") ?? "",
      "province": prefs.getString("province") ?? "",
      "country": prefs.getString("country") ?? "",
      "zip_code": prefs.getString("zip_code") ?? "",
    };
    return data;
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

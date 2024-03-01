import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase{
  static Future<void> setToken(String token) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }
  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }
  

}
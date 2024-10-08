import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> saveLoginDetails(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  Future<Map<String, String?>> getLoginDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'email': prefs.getString('email'),
      'password': prefs.getString('password'),
    };
  }
}

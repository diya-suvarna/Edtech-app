import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<bool> register(
    String name,
    String email,
    String password,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final key = email.trim().toLowerCase();

    if (prefs.containsKey('user_$key')) {
      return false;
    }

    await prefs.setStringList(
      'user_$key',
      [name.trim(), password],
    );

    return true;
  }

  static Future<String?> login(
    String email,
    String password,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final key = email.trim().toLowerCase();

    final user = prefs.getStringList('user_$key');

    if (user == null || user.length < 2 || user[1] != password) {
      return null;
    }

    return user[0];
  }
}
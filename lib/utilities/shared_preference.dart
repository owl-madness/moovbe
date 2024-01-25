import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceHelper {
   static late SharedPreferences _preferences;
   static String tokenKey = 'TOKEN_KEY';
   static String refreshTokenKey = 'REFRESH_TOKEN_KEY';

  // Initialize SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Get a value from SharedPreferences
  static dynamic getValue(String key) {
    return _preferences.get(key);
  }

  // Set a value in SharedPreferences
  static Future<bool> setValue(String key, dynamic value) async {
    if (_preferences == null) {
      await init();
    }

    if (value is int) {
      return await _preferences.setInt(key, value);
    } else if (value is double) {
      return await _preferences.setDouble(key, value);
    } else if (value is bool) {
      return await _preferences.setBool(key, value);
    } else if (value is String) {
      return await _preferences.setString(key, value);
    } else if (value is List<String>) {
      return await _preferences.setStringList(key, value);
    }

    return false; // Unsupported data type
  }

  // Remove a value from SharedPreferences
  static Future<bool> removeValue(String key) async {
    if (_preferences == null) {
      await init();
    }

    return await _preferences.remove(key);
  }

  // Clear all data in SharedPreferences
  static Future<bool> clear() async {
    if (_preferences == null) {
      await init();
    }

    return await _preferences.clear();
  }
}
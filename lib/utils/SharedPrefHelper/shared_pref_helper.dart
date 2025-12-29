
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:momgreta/utils/SharedPrefHelper/pref_keys.dart';

import '../../screens/authentication/login_model/login_model.dart';

class SharedPrefHelper {
  static SharedPreferences? _prefs;

  /// Initialize SharedPreferences (call this once in main.dart before runApp)
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save String
  static Future<bool> setString(String key, String value) async {
    return await _prefs!.setString(key, value);
  }

  /// Get String
  static String? getString(String key, {String? defValue}) {
    return _prefs!.getString(key) ?? defValue;
  }

  /// Save Integer
  static Future<bool> setInt(String key, int value) async {
    return await _prefs!.setInt(key, value);
  }

  /// Get Integer
  static int? getInt(String key, {int? defValue}) {
    return _prefs!.getInt(key) ?? defValue;
  }

  /// Save Boolean
  static Future<bool> setBool(String key, bool value) async {
    return await _prefs!.setBool(key, value);
  }

  /// Get Boolean
  static bool? getBool(String key, {bool? defValue}) {
    return _prefs!.getBool(key) ?? defValue;
  }

  /// Save Double
  static Future<bool> setDouble(String key, double value) async {
    return await _prefs!.setDouble(key, value);
  }

  /// Get Double
  static double? getDouble(String key, {double? defValue}) {
    return _prefs!.getDouble(key) ?? defValue;
  }

  /// Save String List
  static Future<bool> setStringList(String key, List<String> value) async {
    return await _prefs!.setStringList(key, value);
  }

  /// Get String List
  static List<String>? getStringList(String key, {List<String>? defValue}) {
    return _prefs!.getStringList(key) ?? defValue;
  }

  /// Remove specific key
  static Future<bool> remove(String key) async {
    return await _prefs!.remove(key);
  }

  /// Clear all data
  static Future<bool> clear() async {
    return await _prefs!.clear();
  }

  /// Save Model (convert to JSON string)
  static Future<bool> setModel(String key, Map<String, dynamic> json) async {
    String data = jsonEncode(json);
    return await _prefs!.setString(key, data);
  }

  /// Get Model (convert back from JSON string)
  static Map<String, dynamic>? getModel(String key) {
    String? data = _prefs!.getString(key);
    if (data == null) return null;
    return jsonDecode(data);
  }



  static set profile(LoginModel? data) {
    if (data != null) {
      final json = jsonEncode(data);
      _prefs!.setString(PrefeKeys.loginModel, json);
    } else {
      _prefs!.remove(PrefeKeys.loginModel);
    }
  }

  static LoginModel? get profile {
    final jsonString = getModel(PrefeKeys.loginModel);
    if (jsonString != null) {
      try {
        return LoginModel.fromJson(jsonString);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

}

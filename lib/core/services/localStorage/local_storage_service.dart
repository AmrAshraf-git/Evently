
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService{
  static late SharedPreferences _sharedPreferences;

  static init() async {
    _sharedPreferences=await SharedPreferences.getInstance();
  }

  static setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }
  static setBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }
  static setInt(String key, int value) async {
    await _sharedPreferences.setInt(key, value);
  }

  static String? getString(String key) {
    return _sharedPreferences.getString(key);
  }
  static bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }
  static int? getInt(String key) {
    return _sharedPreferences.getInt(key);
  }





}
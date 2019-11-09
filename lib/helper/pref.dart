import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final SharedPref instance = SharedPref._();
  SharedPreferences _prefs;

  SharedPref._() {
    init();
  }

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String getString(String key) => _prefs.getString(key);

  int getInt(String key) => _prefs.getInt(key);

  bool getBool(String key) => _prefs.getBool(key);

  double getDouble(String key) => _prefs.getDouble(key);

  Future<bool> setString(String key, String value) => _prefs.setString(key, value);

  Future<bool> setInt(String key, int value) => _prefs.setInt(key, value);

  Future<bool> setBool(String key, bool value) => _prefs.setBool(key, value);

  Future<bool> setDouble(String key, double value) => _prefs.setDouble(key, value);

  bool containsKey(String key) => _prefs.containsKey(key);

  Future<bool> clear() => _prefs.clear();
}
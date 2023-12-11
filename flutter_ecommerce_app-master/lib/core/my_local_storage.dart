import 'package:shared_preferences/shared_preferences.dart';

class MyLocalStorage {
  late SharedPreferences _prefs;

  MyLocalStorage() {
    _initPrefs(); 
  }

  Future<void> _initPrefs() async {
    // _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setValue(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<String> getValue(String key) async {
    return _prefs.getString(key) ?? '';
  }

  Future<void> removeValue(String key) async {
    await _prefs.remove(key);
  }

  Future<void> clearAll() async {
    await _prefs.clear();
  }
}

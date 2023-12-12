import 'package:shared_preferences/shared_preferences.dart';

class MyLocalStorage {
  Future<void> setValue(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String> getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  Future<void> removeValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<void> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<List<Map<String, String>>> getAllValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<Map<String, String>> keyValueList = [];

    Set<String> keys = prefs.getKeys();

    for (String key in keys) {
      String value = prefs.getString(key) ?? '';
      keyValueList.add({'key': key, 'value': value});
    }

    return keyValueList;
  }
}

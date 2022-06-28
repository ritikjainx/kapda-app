import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPrefs {
  static SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const _rememberMe = 'toRemember';
  static bool getToRemember() => _prefs.getBool(_rememberMe);
  static Future setToRemember(bool value) async => await _prefs.setBool(_rememberMe, value);
}

import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setTheme(bool value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}

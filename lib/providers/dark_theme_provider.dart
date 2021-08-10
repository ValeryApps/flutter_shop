import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/models/theme_preferences.dart';

class DarkThemeProvider with ChangeNotifier {
  var themePreference = ThemePreference();
  bool _darkTheme = false;

  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    themePreference.setTheme(value);
    notifyListeners();
  }
}

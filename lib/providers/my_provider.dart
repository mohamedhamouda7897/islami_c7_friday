import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = 'en';
  ThemeMode themeMode = ThemeMode.light;

  void changeLanguage(String isoCode) {
    languageCode = isoCode;
    notifyListeners();
  }

  void changeTheme() {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  String getBackground() {
    if (themeMode == ThemeMode.light) {
      return 'assets/images/main_bg.png';
    }
    return 'assets/images/main_background_dark.png';
  }
}

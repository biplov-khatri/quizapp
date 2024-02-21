// theme_provider.dart

import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _currentTheme = ThemeMode.light;

  ThemeMode get currentTheme => _currentTheme;

  void toggleDarkMode(bool isDarkMode) {
    _currentTheme = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

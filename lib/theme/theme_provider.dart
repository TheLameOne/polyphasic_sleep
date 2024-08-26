import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/theme/dark_mode.dart';
import 'package:polyphasic_sleep_new/theme/green_mode.dart';
import 'package:polyphasic_sleep_new/theme/light_mode.dart';
import 'package:polyphasic_sleep_new/theme/blue_mode.dart';
import 'package:polyphasic_sleep_new/theme/red_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // Store the available themes in a list
  final List<ThemeData> _themes = [
    lightMode,
    darkMode,
    blueMode,
    redMode,
    greenMode,
  ];

  // Track the current theme index
  int _currentThemeIndex = 0;

  // Get the current theme
  ThemeData get themeData => _themes[_currentThemeIndex];

  // Toggle the theme by cycling through the list
  void toggleTheme() {
    _currentThemeIndex = (_currentThemeIndex + 1) % _themes.length;
    notifyListeners();
  }

  // Optionally, allow setting a specific theme by index
  void setTheme(int themeIndex) {
    if (themeIndex >= 0 && themeIndex < _themes.length) {
      _currentThemeIndex = themeIndex;
      notifyListeners();
    }
  }

  // Optionally, return the current theme index
  int get currentThemeIndex => _currentThemeIndex;
}

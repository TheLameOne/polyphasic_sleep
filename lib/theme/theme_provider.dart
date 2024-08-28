import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/theme/brick_dark.dart';
import 'package:polyphasic_sleep_new/theme/burnt_umber_dark.dart';
import 'package:polyphasic_sleep_new/theme/cocoa_dark.dart';
import 'package:polyphasic_sleep_new/theme/ebony_dark.dart';
import 'package:polyphasic_sleep_new/theme/mocha_dark.dart';
import 'package:polyphasic_sleep_new/theme/terracotta_light.dart';
import 'package:polyphasic_sleep_new/theme/rustic_beige_light.dart';
import 'package:polyphasic_sleep_new/theme/copper_sand_light.dart';
import 'package:polyphasic_sleep_new/theme/warm_earth_light.dart';
import 'package:polyphasic_sleep_new/theme/muted_desert_light.dart';

class ThemeProvider extends ChangeNotifier {
  // Store the available themes in lists
  final List<ThemeData> _lightThemes = [
    copperSandLight,
    mutedDesertLight,
    rusticBeigeLight,
    terracottaLight,
    warmEarthLight
  ];
  final List<ThemeData> _darkThemes = [
    brickDark,
    burntUmberDark,
    cocoaDark,
    ebonyDark,
    mochaDark
  ];

  // Track the current theme index and dark mode state
  int _currentThemeIndex = 0;
  bool _darkMode = false;

  // Get the current theme
  ThemeData get themeData => (_darkMode)
      ? _darkThemes[_currentThemeIndex % _darkThemes.length]
      : _lightThemes[_currentThemeIndex % _lightThemes.length];

  // Toggle the theme by cycling through the list
  void toggleTheme() {
    _currentThemeIndex = (_currentThemeIndex + 1) %
        (_darkMode ? _darkThemes.length : _lightThemes.length);
    notifyListeners();
  }

  // Toggle between light and dark mode
  void toggleDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }

  // Set a specific theme by index
  void setTheme(int themeIndex) {
    if (_darkMode && themeIndex >= 0 && themeIndex < _darkThemes.length) {
      _currentThemeIndex = themeIndex;
    } else if (!_darkMode &&
        themeIndex >= 0 &&
        themeIndex < _lightThemes.length) {
      _currentThemeIndex = themeIndex;
    }
    notifyListeners();
  }

  // Get the current theme index
  int get currentThemeIndex => _currentThemeIndex;

  // Get whether the current theme is dark mode
  bool get isDarkMode => _darkMode;
}

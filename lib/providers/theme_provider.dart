import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider((ref) => ThemeProvider());

class ThemeProvider extends ChangeNotifier {
  var _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void selectDarkThemeMode() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }

  void selectLightThemeMode() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }

  void selectSystemThemeMode() {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

enum AppThemeMode {
  light,
  dark,
}

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();
  ThemeData get themeData => _themeData;

  void setThemeData(AppThemeMode appThemeMode) {
    _themeData = appThemeMode == AppThemeMode.light
        ? ThemeData.light()
        : ThemeData.dark();
    notifyListeners();
  }
}

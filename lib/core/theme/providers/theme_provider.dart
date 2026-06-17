import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_test/core/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  static const _key = 'theme_is_dark';

  bool _isDark = false;

  bool get isDark => _isDark;
  ThemeData get theme => _isDark ? AppTheme.dark : AppTheme.light;

  ThemeNotifier() {
    _init();
  }

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey(_key)) {
      _isDark = prefs.getBool(_key)!;
    } else {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      _isDark = brightness == Brightness.dark;
    }

    notifyListeners();
  }

  Future<void> toggle() async {
    _isDark = !_isDark;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, _isDark);
  }
}

final themeProvider = ChangeNotifierProvider<ThemeNotifier>(
  (ref) => ThemeNotifier(),
);

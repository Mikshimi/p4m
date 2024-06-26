import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/app_theme/app_theme.dart';
import '../services/settings_service.dart';

class SettingsController with ChangeNotifier {
  final SettingsService _settingsService;

  late ThemeData _themeData;

  SettingsController(this._settingsService);

  ThemeData get themeData => _themeData;

  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("userSetTheme")) {
      _themeData = await _settingsService.themeData();
    } else {
      _themeData = P4MThemes.p4MAmericaTheme;
    }
  }

  Future<void> updateThemeData(ThemeData? newThemeData) async {
    if (newThemeData == null) return;

    if (newThemeData == _themeData) return;

    _themeData = newThemeData;

    notifyListeners();

    await _settingsService.updateThemeData(newThemeData);
  }
}

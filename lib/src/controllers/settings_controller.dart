import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/app_theme/app_theme.dart';
import '../services/settings_service.dart';

class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  final SettingsService _settingsService;

  late ThemeData _themeData;

  ThemeData get themeData => _themeData;

  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("userSetTheme")) {
      _themeData = await _settingsService.themeData();
    } else {
      _themeData = P4MThemes.cloud9Theme;
    }

    // Determine the platform and set the storage service
    // Apparently at the time of creating this, Msgpack does not have certain web
    // support features. Hence the need for dual large data handlers as
    // shared prefferences will be used to handle smaller data
  }

  Future<void> updateThemeData(ThemeData? newThemeData) async {
    if (newThemeData == null) return;

    if (newThemeData == _themeData) return;

    _themeData = newThemeData;

    notifyListeners();

    await _settingsService.updateThemeData(newThemeData);
  }

  // Add getLibrarySegment method
  Future<Map<String, String>> getLibrarySegment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String libraryName = prefs.getString('libraryName') ?? 'p4m_library';
    String segment = prefs.getString('segment') ?? 'short';
    return {'libraryName': libraryName, 'segment': segment};
  }
}

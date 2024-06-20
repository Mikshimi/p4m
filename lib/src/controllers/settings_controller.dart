import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/app_theme/app_theme.dart';
import '../services/msgpack_service.dart';
import '../services/json_storage_service.dart';
import '../services/storage_service.dart';
import '../services/settings_service.dart';

class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  final SettingsService _settingsService;

  late ThemeData _themeData;
  late StorageService _storageService;

  ThemeData get themeData => _themeData;
  StorageService get storageService => _storageService;

  Future<void> loadSettings() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    if (prefs.containsKey("userSetTheme")) {
      _themeData = await _settingsService.themeData();
    } else {
      _themeData = P4MThemes.duskTheme;
    }

    // Determine the platform and set the storage service
    // Apparently at the time of creating this, Msgpack does not have certain web
    // support features. Hence the need for dual large data handlers as
    // shared prefferences will be used to handle smaller data

    if (kIsWeb) {
      _storageService = JsonStorageService();
    } else {
      _storageService = MsgpackStorageService();
    }
    notifyListeners();
  }

  Future<void> updateThemeData(ThemeData? newThemeData) async {
    if (newThemeData == null) return;

    if (newThemeData == _themeData) return;

    _themeData = newThemeData;

    notifyListeners();

    await _settingsService.updateThemeData(newThemeData);
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme/app_theme.dart';

class ThemeServices {
  static late SharedPreferences prefs;

  static ThemeServices? _instance;

  static Future<ThemeServices> get instance async {
    if (_instance == null) {
      prefs = await SharedPreferences.getInstance();
      _instance = ThemeServices._();
    }
    return _instance!;
  }

  final Map allThemes = <String, ThemeData>{
    'classicLight': P4MThemes.p4MClassicLightTheme,
    'classicDark': P4MThemes.p4MClassicdarkTheme,
    'summer': P4MThemes.summerTheme,
    'autumn': P4MThemes.autumnTheme,
    'dusk': P4MThemes.duskTheme,
    'winter': P4MThemes.winterTheme,
    'midnight': P4MThemes.midnightTheme,
    'cloud9': P4MThemes.cloud9Theme,
  };

  //Just swopping key values to prevent using more tools eg: Json encode/decode
  final Map allThemesKVSwap = <ThemeData, String>{
    P4MThemes.p4MClassicLightTheme: 'classicLight',
    P4MThemes.p4MClassicdarkTheme: 'classicDark',
    P4MThemes.summerTheme: 'summer',
    P4MThemes.autumnTheme: 'autumn',
    P4MThemes.duskTheme: 'dusk',
    P4MThemes.winterTheme: 'winter',
    P4MThemes.midnightTheme: 'midnight',
    P4MThemes.cloud9Theme: 'cloud9',
  };

  ThemeServices._();

  ThemeData get activeTheme {
    String? themeName = prefs.getString('activeTheme');
    themeName = platformBrightnessCheck(themeName);
    return allThemes[themeName]!;
  }

  String get previousThemeName {
    String? themeName = prefs.getString('previousThemeName');
    themeName = platformBrightnessCheck(themeName);
    return themeName!;
  }

  ThemeData getByStringName(String name) {
    return allThemes[name]!;
  }

  //for settings service purposes
  ThemeData getByThemeObject(ThemeData theme) {
    return allThemesKVSwap[theme]!;
  }

  String? platformBrightnessCheck(String? themeName) {
    if (themeName == null) {
      final isPlatformDark =
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark;
      themeName = isPlatformDark ? 'classicLight' : 'classicDark';
    }
    return themeName;
  }

  //prevents extra work
saveNewTheme(String newThemeName) {
  var currentThemeName = prefs.getString('activeTheme');
  if (currentThemeName != null) {
    prefs.setBool("userSetTheme", true);
    prefs.setString('previousThemeName', currentThemeName);
  }
  prefs.setString('activeTheme', newThemeName); // Corrected key
}

  // saveNewTheme(String newThemeName) {
  //   var currentThemeName = prefs.getString('activeTheme');
  //   if (currentThemeName != null) {
  //     prefs.setBool("userSetTheme", true);
  //     prefs.setString('previousThemeName', currentThemeName);
  //   }
  //   prefs.setString('theme', newThemeName);
  // }
}

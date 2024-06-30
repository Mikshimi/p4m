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
    'America': P4MThemes.p4MAmericaTheme,
    'Delux': P4MThemes.p4MDeluxTheme,
    'The_Ocean': P4MThemes.p4MOceanTheme,
    'Natures_Call': P4MThemes.p4MNatureTheme,
    'Whisper': P4MThemes.p4MLispTheme,
    'Authors_Notes': P4MThemes.p4MAuthorTheme,
  };

  //Just swopping key values to prevent using more tools eg: Json encode/decode
  final Map allThemesKVSwap = <ThemeData, String>{
    P4MThemes.p4MAmericaTheme: 'America',
    P4MThemes.p4MDeluxTheme: 'Delux',
    P4MThemes.p4MOceanTheme: 'The_Ocean',
    P4MThemes.p4MNatureTheme: 'Natures_Call',
    P4MThemes.p4MLispTheme: 'Whisper',
    P4MThemes.p4MAuthorTheme: 'Authors_Notes',
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
      themeName = isPlatformDark ? 'America' : 'Natures_Call';
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/theme_services.dart';

class SettingsService {
  /*
    Theme Stuff first
  */
  Future<ThemeData> themeData() async {
    ThemeServices services = await ThemeServices.instance;
    return services.activeTheme;
  }

  Future<void> updateThemeData(ThemeData themeData) async {
    ThemeServices themeServices = await ThemeServices.instance;
    if (themeServices.allThemesKVSwap.containsKey(themeData)) {
      String updatedThemeName = themeServices.allThemesKVSwap[themeData]!;
      themeServices.saveNewTheme(updatedThemeName);
    } else {
      if (kDebugMode) {
        print("Error on updating the themes");
      }
    }

    // ignore: unused_element
    Future<void> clearAllPreferences() async {
      SharedPreferences allPrefs = await SharedPreferences.getInstance();
      await allPrefs.clear();
    }

    // ignore: unused_element
    Future<void> clearSpecificPreferences(String fieldYouWannaClear) async {
      SharedPreferences singlePrefs = await SharedPreferences.getInstance();
      await singlePrefs.remove(fieldYouWannaClear);
    }
  }

  Future<void> clearAllPreferences() async {
    SharedPreferences allPrefs = await SharedPreferences.getInstance();
    await allPrefs.clear();
  }

  Future<void> clearSpecificPreferences(String fieldYouWannaClear) async {
    SharedPreferences singlePrefs = await SharedPreferences.getInstance();
    await singlePrefs.remove(fieldYouWannaClear);
  }
}

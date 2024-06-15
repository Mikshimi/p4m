import 'package:flutter/material.dart';
import 'app_theme/app_theme.dart';

String pathToUiImages = 'assets/images/ui/';
String p4mLogo = ('${pathToUiImages}logo2.png');

//background wallpaper images
List<String> uiBGImagesList = [
  ('${pathToUiImages}aFreshStart.png'),
  ('${pathToUiImages}cresentDusk.jpeg'),
  ('${pathToUiImages}darkMidnight.jpeg'),
  ('${pathToUiImages}everestNight.jpeg'),
  ('${pathToUiImages}forestDusk.webp'),
  ('${pathToUiImages}pineDusk.jpeg'),
  ('${pathToUiImages}satarnDawn.jpeg'),
  ('${pathToUiImages}snowyDawn.jpeg'),
  ('${pathToUiImages}starryNight.jpeg'),
  ('${pathToUiImages}splashImage.png')
];

//prayer text backgrounds. minimilist theme removes most images
List<String> prayerBGImagesList = [
  ('${pathToUiImages}slate.jpg'),
  ('${pathToUiImages}wall_fern.jpg'),
  ('${pathToUiImages}wall_cracks.jpg'),
];

String pathToProfileImages = 'assets/images/user_images/profile/';
List<String> defaultProfileImagesList = [
  ('${pathToProfileImages}America.png'),
  ('${pathToProfileImages}aroura.png'),
  ('${pathToProfileImages}Britan.png'),
  ('${pathToProfileImages}diochan.png'),
  ('${pathToProfileImages}fantastic4.png'),
  ('${pathToProfileImages}vannessa.png'),
];

String stripPaths(pathFileName) {
  String fileName = pathFileName;
  String withoutPath = fileName.split('/').last;
  String rawNameOnly = withoutPath.split('.').first;
  return rawNameOnly;
}

  ThemeData themeChange(varriantChoice) {
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

    return allThemes[varriantChoice];
  }

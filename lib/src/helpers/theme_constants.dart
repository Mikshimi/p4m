import 'package:flutter/material.dart';
import 'app_theme/app_theme.dart';

String pathToUiImages = 'assets/images/ui/';
String pathToBackgrounds = 'assets/images/backgrounds/';
String p4mLogo = ('${pathToUiImages}logo2.png');

//background wallpaper images
List<String> backgroundImagesList = [
  ('${pathToBackgrounds}I0TrumpThumbs.png'),
  ('${pathToBackgrounds}I1TrumpSmile.png'),
  ('${pathToBackgrounds}I2Yena.png'),
  ('${pathToBackgrounds}I3JayAlicia.png'),
  ('${pathToBackgrounds}I4KidRally.png'),
  ('${pathToBackgrounds}I5MAGA.png'),
  ('${pathToBackgrounds}I6Election.png'),
  ('${pathToBackgrounds}I7EagleView.png'),
  ('${pathToBackgrounds}I8TrumpSign.png'),
  ('${pathToBackgrounds}I9TrumpGreet.png')
];
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
    'America': P4MThemes.p4MAmericaTheme,
    'Delux': P4MThemes.p4MDeluxTheme,
    'The_Ocean': P4MThemes.p4MOceanTheme,
    'Natures_Call': P4MThemes.p4MNatureTheme,
    'Whisper': P4MThemes.p4MLispTheme,
    'Authors_Notes': P4MThemes.p4MAuthorTheme,
  };

  return allThemes[varriantChoice];
}

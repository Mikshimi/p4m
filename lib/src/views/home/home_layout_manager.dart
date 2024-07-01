import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../helpers/dimensions.dart';
import '../../helpers/theme_constants.dart';
import '../../data/models/prayer.dart';
import '../settings/settings_view.dart';

part 'layouts/home_landscape.dart';
part 'layouts/home_large_screen.dart';
part 'layouts/home_portrait.dart';

class HomeLayoutManager extends StatelessWidget {
  static const routeName = '/home';
  final List<Prayer> loadedDatabase;

  const HomeLayoutManager({super.key, required this.loadedDatabase});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;

    var screenOrientation = mediaQuery.orientation;

    //add animations to the transitions/loading the required screen

    if (screenWidth > 600) {
      return HomeLargeScreen(
        accessingDatabase: loadedDatabase,
      );
    } else if (screenOrientation == Orientation.portrait) {
      return const HomePortrait();
    }
    return const HomeLandscape();
  }
}

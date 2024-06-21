import 'package:flutter/material.dart';
import 'package:pray_for_me/src/views/home/layouts/home_landscape.dart';
import 'package:pray_for_me/src/views/home/layouts/home_large_screen.dart';
import 'package:pray_for_me/src/views/home/layouts/home_portrait.dart';

// import '../../helpers/theme_constants.dart';

class HomeLayoutManager extends StatefulWidget {
  static const routeName = '/home';
  const HomeLayoutManager({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeLayoutManagerState createState() => _HomeLayoutManagerState();
}

class _HomeLayoutManagerState extends State<HomeLayoutManager> {
    @override
  Widget build(BuildContext context) {
    
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;

    var screenOrientation = mediaQuery.orientation;

    //add animations to the transitions/loading the required screen

    if (screenWidth > 600) {
      return const HomeLargeScreen();
    } else if (screenOrientation == Orientation.portrait) {
      return const HomePortrait();
    }
    return const HomeLandscape();
  }

}

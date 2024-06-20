import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../helpers/dimensions.dart';
import '../../../helpers/theme_constants.dart';

class HomeLandscape extends StatefulWidget {
  const HomeLandscape({
    super.key,
  });

  @override
  State<HomeLandscape> createState() => _HomeLandscapeState();
}

class _HomeLandscapeState extends State<HomeLandscape> {
  @override
  Widget build(BuildContext context) {
    int displayedImage = 3;
    bool loadWidgets = false;

    return Scaffold(
        /*We're skipping the app bar for a custom design. there are features 
        within app bar that is not relevant to the user, eg : back button.
        
      */
        body: Container(
      width: Dimensions.p4mScreenWidth,
      height: Dimensions.p4mScreenHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(backgroundImagesList[displayedImage]),
            fit: BoxFit.fill),
      ),
      child: ad2(loadWidgets),
      // const Center(
      //   child: Text("Hi there on Large Friend"),
      // ),
    ));
  }

  Container ad2(loadWidgets) {
    if (loadWidgets == true) {
      return Container(
        width: Dimensions.p4mScreenWidth,
        height: Dimensions.p4mScreenWidth,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
        child: const Text("Container Live on land"),
      );
    }
    return Container(
      alignment: Alignment.bottomCenter,
      child: AnimatedTextKit(
        pause: Durations.extralong4,
        animatedTexts: [
          FadeAnimatedText('P 4 M_Land'),
        ],
        repeatForever: true,
      ),
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../helpers/dimensions.dart';
import '../../../helpers/theme_constants.dart';
import '../../settings/settings_view.dart';

class HomeLargeScreen extends StatefulWidget {
  const HomeLargeScreen({
    super.key,
  });

  @override
  State<HomeLargeScreen> createState() => _HomeLargeScreenState();
}

class _HomeLargeScreenState extends State<HomeLargeScreen> {
  @override
  Widget build(BuildContext context) {
    int displayedImage = 4;
    bool loadWidgets = true;

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
    ));
  }

  Container ad2(loadWidgets) {
    if (loadWidgets == true) {
      return Container(
          width: Dimensions.p4mScreenWidth,
          height: Dimensions.p4mScreenWidth,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
          child: Row(
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                IconButton(
                  icon: Icon(
                    Icons.settings_outlined,
                    size: Dimensions.iconSizeMedium,
                  ),
                  onPressed: () {
                    Navigator.restorablePushNamed(
                        context, SettingsView.routeName);
                  },
                ),
                const Spacer()
              ]),
            ],
          ));
    }
    return Container(
      alignment: Alignment.bottomCenter,
      child: AnimatedTextKit(
        pause: Durations.extralong4,
        animatedTexts: [
          FadeAnimatedText('P 4 M_Large'),
        ],
        repeatForever: true,
      ),
    );
  }
}

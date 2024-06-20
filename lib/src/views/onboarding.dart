import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
/*
  will be modified in time. the main test is functionality for now
 */
import '../helpers/theme_constants.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*
      This screen is basically a visual condensed readme about the app yes
        - displays 'pray for me' as a product and briefly explains most of the 
        - > features available for the user to consume
        - This screen appears only at the first instance run. once the user is
        - > initialized, then it will remain disabled indefinately. 
    */
    // SharedPreferences special = await SharedPreferences.getInstance();
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome",
          body: "Welcome to our app!",
          image: Image.asset(uiBGImagesList[0], fit: BoxFit.contain),
        ),
        PageViewModel(
          title: "Feature 1",
          body: "Description of feature 1.",
          image: Image.asset(
            prayerBGImagesList[0],
            fit: BoxFit.contain,
          ),
        ),
      ],
      onDone: () {
        Navigator.of(context).pushReplacementNamed('/splash');
      },
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}

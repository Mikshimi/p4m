import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../global_widgets/p4m_playground/animations/page_transition_1.dart';
import '../home/home_layout_manager.dart';
// import '../prayers/prayers_view.dart';

/*
  The splash screen will be utilized as a loading screen. What is to be loaded 
  is the following: 
    user related app prefference data,
    user history
    prayer data (
      the way prayer data is to be loaded is rather simple
      inorder to reduce memory consumption, only load parts of the library at
      once. lets say there are 3000+ prayers > load less than 10% of it into 
      memory. Even then the user can only view a fraction of the 10% loaded at 
      once probably 1% of the total prayer database. 
      there are approximately 160+ categories/sub categories which is 
      further split: short(<50 words), medium(<100 words) long prayers (+100)

    )
*/
class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const routeName = '/splash';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // restorationId: 'splash',
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ad(),
    ));
  }

  Container ad() {
    return Container(
      width: 250.0,
      alignment: Alignment.center,
      child: DefaultTextStyle(
        style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 100.0,
            fontWeight: FontWeight.w200,
            fontFamily: "Roboto"),
        child: AnimatedTextKit(
          animatedTexts: [
            FadeAnimatedText('P 4 M'),
          ],
          totalRepeatCount: 1,
          onFinished: () {
            Navigator.pushReplacement(
              context,
              createRouteWithTransition(
                  const HomeLayoutManager(), HomeLayoutManager.routeName),
            );
          },
        ),
      ),
    );
  }
}

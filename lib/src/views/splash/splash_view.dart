import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../global_widgets/p4m_playground/page_animations/page_transition_1.dart';
import '../home/home_screen.dart';

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
                  const HomeScreen(), HomeScreen.routeName),
            );
          },
        ),
      ),
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'animations.dart';
import '../helpers/theme_constants.dart';

class ImageSwitcher extends StatefulWidget {
  const ImageSwitcher({super.key});
  static const routeName = '/image_change';
  @override
  State<ImageSwitcher> createState() => _ImageSwitcherState();
}

class _ImageSwitcherState extends State<ImageSwitcher> {
  int selectedIndex = 0;
  bool showOption = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        restorationId: 'image_switch_screen',
        appBar: AppBar(
          title: Text(stripPaths(defaultProfileImagesList[selectedIndex])),
          forceMaterialTransparency: true,
        ),
        floatingActionButton: floatActButton(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(defaultProfileImagesList[selectedIndex]),
                fit: BoxFit.cover),
          ),
          child: ad(selectedIndex),
        ));
  }

  Container floatActButton() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
              child: showOption
                  ? ShowUpAnimation(
                      delay: 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: defaultProfileImagesList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: selectedIndex == index
                                    ? const Color.fromARGB(255, 255, 211, 89)
                                    : Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      defaultProfileImagesList[index],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  : const SizedBox()),
          const SizedBox(
            width: 20,
          ),
          showOption
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      showOption = false;
                    });
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ))
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      showOption = true;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          defaultProfileImagesList[selectedIndex],
                        ),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

SizedBox ad(selectedIndex) {
  return SizedBox(
    width: 250.0,
    child: DefaultTextStyle(
      style: const TextStyle(
          color: Color.fromARGB(255, 255, 211, 89),
          fontSize: 32.0,
          fontWeight: FontWeight.w200,
          fontFamily: "Roboto"),
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
              'Welcome:\t${stripPaths(defaultProfileImagesList[selectedIndex]).toUpperCase()}'),
        ],
        onTap: () {
          // ignore: avoid_print
          print("Tap Event");
        },
      ),
    ),
  );
}

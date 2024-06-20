import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class SavePrayerImage extends StatelessWidget {
  final ScreenshotController screenshotController = ScreenshotController();

  SavePrayerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Save Prayer Image')),
      body: Screenshot(
        controller: screenshotController,
        child: Container(
          color: Colors.white,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Prayer Text Here', style: TextStyle(fontSize: 24)),
              // Additional widgets like background image, logo, etc.
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          screenshotController.capture().then((image) {
            // Save image to device
          });
        },
      ),
    );
  }
}

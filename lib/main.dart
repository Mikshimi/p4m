import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/p4m_app.dart';
import 'src/controllers/settings_controller.dart';
import 'src/views/settings/settings_service.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812), // Adjust based on your design dimensions
      // minTextAdapt: true,
      builder: (context, child) {
        return Pray4MeApp(
          settingsController: settingsController,
        );
      },
    ),
  );
}

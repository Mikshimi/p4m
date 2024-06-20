import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/p4m_app.dart';
import 'src/controllers/settings_controller.dart';
import 'src/services/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812), // Adjust based on the design dimensions
      // minTextAdapt: true,
      builder: (context, child) {
        return Pray4MeApp(
          settingsController: settingsController,
        );
      },
    ),
  );
}

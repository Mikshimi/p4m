import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/p4m_app.dart';
import 'src/controllers/settings_controller.dart';
import 'src/services/settings_service.dart';
import 'src/services/loading_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  
  final loadingService = LoadingService();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812), // Adjust based on the design dimensions
      builder: (context, child) {
        return Pray4MeApp(
          settingsController: settingsController,
          loadingService: loadingService,
        );
      },
    ),
  );
}

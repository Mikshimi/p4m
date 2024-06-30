import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/p4m_app.dart';
import 'src/controllers/settings_controller.dart';
import 'src/services/settings_service.dart';
import 'src/services/loading_service.dart';
import 'src/bloc/prayer_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  final loadingService = LoadingService();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<PrayerBloc>(
              create: (_) => PrayerBloc(loadingService: loadingService),
            ),
            // will be adding other blocs if needed
          ],
          child: Pray4MeApp(
            settingsController: settingsController,
          ),
        );
      },
    ),
  );
}

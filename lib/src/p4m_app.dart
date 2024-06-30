import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'views/home/home_layout_manager.dart';
import 'global_widgets/image_switcher.dart';
import 'views/prayers/prayer_view.dart';
import 'views/splash/splash_view.dart';
import 'views/onboarding.dart';
import 'controllers/settings_controller.dart';
import 'views/settings/settings_view.dart';

class Pray4MeApp extends StatelessWidget {
  const Pray4MeApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'p4m_app_r_id',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('zh', ''),
            Locale('en', 'US'),
            Locale('fr', 'CH'),
          ],
          theme: settingsController.themeData,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case ImageSwitcher.routeName:
                    return const ImageSwitcher();
                  case PrayerView.routeName:
                    return const PrayerView();
                  case OnboardingScreen.routeName:
                    return const OnboardingScreen();
                  case SplashView.routeName:
                    return const SplashView(
                      libraryName: '',
                      librarySize: 'short',
                    );
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case HomeLayoutManager.routeName:
                    return const HomeLayoutManager(
                      loadedDatabase: [],
                    );
                  default:
                    return const SplashView(
                      libraryName: '',
                      librarySize: 'short',
                    );
                }
              },
            );
          },
        );
      },
    );
  }
}

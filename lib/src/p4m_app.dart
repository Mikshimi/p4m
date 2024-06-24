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
          return FutureBuilder<Map<String, String>>(
            future: settingsController.getLibrarySegment(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                final libraryName = snapshot.data?['libraryName'] ?? 'p4m_library';
                // ignore: unused_local_variable
                final segment = snapshot.data?['segment'] ?? 'short';

                return MaterialApp(
                  restorationScopeId: 'p4m_app_r_id',
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('zh', ''),
                    Locale('en', 'US'), // American English
                    Locale('fr', 'CH'), // Swiss French
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
                            return SplashView(libraryName: libraryName);
                          case SettingsView.routeName:
                            return SettingsView(controller: settingsController);
                          case HomeLayoutManager.routeName:
                            return const HomeLayoutManager();
                          default:
                            return SplashView(libraryName: libraryName);
                        }
                      },
                    );
                  },
                );
              }
            },
          );
        });
  }
}

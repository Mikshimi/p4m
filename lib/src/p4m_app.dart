import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'views/home/home_layout_manager.dart';
import 'global_widgets/image_switcher.dart';
import 'views/prayers/prayer_view.dart';
import 'views/splash/splash_view.dart';
import 'views/onboarding.dart';
import 'controllers/settings_controller.dart';
import 'views/settings/settings_view.dart';
import 'services/loading_service.dart';

//Requires accessing prefs to determine loading library; Will be addressed yes.
class Pray4MeApp extends StatelessWidget {
  const Pray4MeApp({
    super.key,
    required this.settingsController,
    required this.loadingService,
  });

  final SettingsController settingsController;
  final LoadingService loadingService;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            restorationScopeId: 'p4m_app_r_id',
            localizationsDelegates: const [
              // AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('zh', ''),
              Locale('en', 'US'), // American English
              Locale('fr', 'CH'), // Swiss French
            ],
            // onGenerateTitle: (BuildContext context) =>
            //     AppLocalizations.of(context)!.appTitle,
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
                      return SplashView(
                          loadingService: loadingService,
                          libraryName: 'p4m_library_seed',
                          librarySize: 'short'); //temp
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    case HomeLayoutManager.routeName:
                      return const HomeLayoutManager(
                        loadedDatabase: [],
                      );
                    default:
                      return SplashView(
                        loadingService: loadingService,
                        libraryName: "p4m_library_seed",
                        librarySize: "short", //temp
                      );
                  }
                },
              );
            },
          );
        });
  }
}

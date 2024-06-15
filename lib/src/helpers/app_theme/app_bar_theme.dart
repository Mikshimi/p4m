part of 'app_theme.dart';

@immutable
class _AppBarTheme {
  static final AppBarTheme _appBarLightTheme = AppBarTheme(
    color: _P4MColors.deepTeal,
    iconTheme: const IconThemeData(color: Colors.white),
    toolbarTextStyle: const TextTheme(
            titleLarge: TextStyle(color: Colors.white, fontSize: 20))
        .bodyMedium,
    titleTextStyle: const TextTheme(
            titleLarge: TextStyle(color: Colors.white, fontSize: 20))
        .titleLarge,
  );

  static final AppBarTheme _appBarDarkTheme = AppBarTheme(
    color: _P4MColors.deepTeal,
    iconTheme: const IconThemeData(color: Colors.black),
    toolbarTextStyle: const TextTheme(
            titleLarge: TextStyle(color: Colors.black, fontSize: 20))
        .bodyMedium,
    titleTextStyle: const TextTheme(
            titleLarge: TextStyle(color: Colors.black, fontSize: 20))
        .titleLarge,
  );

  /*static const _appBarLightTheme = AppBarTheme(
    toolbarHeight: 50,
    backgroundColor: _P4MColors.white,
    titleTextStyle: TextStyle(color: _P4MColors.deepSilver),
    shadowColor: Colors.transparent,
    titleSpacing: 1,
    actionsIconTheme: IconThemeData(color: _P4MColors.deepSilver),
    iconTheme: IconThemeData(
      color: _P4MColors.deepSilver,
    ),
  );

  static const _appBarDarkTheme = AppBarTheme(
    toolbarHeight: 50,
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(color: _P4MColors.deepSilver),
    shadowColor: Colors.transparent,
    titleSpacing: 1,
    actionsIconTheme: IconThemeData(color: _P4MColors.white),
    centerTitle: true,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    foregroundColor: _P4MColors.white,
  );
  */
}

part of 'app_theme.dart';

class _AppBarTheme {
  static final AppBarTheme _appBarAmerica = AppBarTheme(
    color: P4MColors.americaLight.elementAt(1),
    iconTheme: IconThemeData(color: P4MColors.americaLight[3]),
    titleTextStyle: const TextTheme(
            titleLarge: TextStyle(color: P4MColors.americaNavyD, fontSize: 20))
        .titleLarge,
  );

  static final AppBarTheme _appBarLisp = AppBarTheme(
    color: P4MColors.lispLight.elementAt(0),
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: const TextTheme(
            titleLarge: TextStyle(color: Colors.black, fontSize: 20))
        .titleLarge,
  );

  static final AppBarTheme _appBarDelux = AppBarTheme(
    color: P4MColors.deluxLight.elementAt(0),
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextTheme(
            titleLarge: TextStyle(color: Colors.white, fontSize: 20))
        .titleLarge,
  );

  static final AppBarTheme _appBarOcean = AppBarTheme(
    color: P4MColors.oceanDark.elementAt(0),
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextTheme(
            titleLarge: TextStyle(color: Colors.white, fontSize: 20))
        .titleLarge,
  );

  static final AppBarTheme _appBarNature = AppBarTheme(
    color: P4MColors.natureDark.elementAt(0),
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextTheme(
            titleLarge: TextStyle(color: Colors.white, fontSize: 20))
        .titleLarge,
  );

  static final AppBarTheme _appBarAuthor = AppBarTheme(
    color: P4MColors.authorDark.elementAt(1),
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextTheme(
            titleLarge: TextStyle(color: Colors.white, fontSize: 20))
        .titleLarge,
  );
}

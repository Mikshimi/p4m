import 'package:flutter/material.dart';
part 'app_bar_theme.dart';
part 'app_color_scheme.dart';
part 'app_colors.dart';

@immutable
class P4MThemes {
  static final p4MClassicLightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _P4MColorScheme._p4MLightColorScheme,
    // textTheme: _TextTheme._textLightTheme,
    fontFamily: "Roboto",
    appBarTheme: _AppBarTheme._appBarLightTheme,
    scaffoldBackgroundColor: _P4MColorScheme._p4MLightColorScheme.surface,
  );

  static final p4MClassicdarkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: _P4MColorScheme._p4MDarkColorScheme,
    // textTheme: _TextTheme._textDarkTheme,
    fontFamily: "Roboto",
    appBarTheme: _AppBarTheme._appBarDarkTheme,
    scaffoldBackgroundColor: _P4MColorScheme._p4MDarkColorScheme.surface,
  );

  static final cloud9Theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: _P4MColors.lightBlue,
    // textTheme: _TextTheme._textLightTheme,
    fontFamily: "Roboto",
  );

  static final summerTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: _P4MColors.deepYellow,
    // textTheme: _TextTheme._textLightTheme,
    fontFamily: "Roboto",
  );

  static final autumnTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: _P4MColors.deepBrown,
    // textTheme: _TextTheme._textLightTheme,
    fontFamily: "Roboto",
  );

  static final duskTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: _P4MColors.brightRed,
    // textTheme: _TextTheme._textDarkTheme,
    fontFamily: "Roboto",
  );

  static final midnightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: const Color.fromARGB(255, 12, 28, 32),
    // textTheme: _TextTheme._textDarkTheme,
    fontFamily: "Roboto",
  );

  static final winterTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: _P4MColors.deepTeal,
    // textTheme: _TextTheme._textDarkTheme,
    fontFamily: "Roboto",
  );
}

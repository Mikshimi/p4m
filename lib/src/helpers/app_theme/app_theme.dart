import 'package:flutter/material.dart';
import 'package:pray_for_me/src/helpers/dimensions.dart';
part 'app_bar_theme.dart';
part 'app_color_scheme.dart';
part 'app_colors.dart';
part 'app_text_theme.dart';

@immutable
class P4MThemes {
  static final p4MAmericaTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _P4MColorScheme.p4MAmericaColorScheme,
    // textTheme: _TextTheme._textLightTheme,
    fontFamily: "Roboto",
    appBarTheme: _AppBarTheme._appBarAmerica,
    scaffoldBackgroundColor: _P4MColorScheme.p4MAmericaColorScheme.surface,
  );

  static final p4MDeluxTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _P4MColorScheme.p4MDeluxColorScheme,
    // textTheme: _TextTheme._textDarkTheme,
    fontFamily: "Roboto",
    appBarTheme: _AppBarTheme._appBarDelux,
    scaffoldBackgroundColor: _P4MColorScheme.p4MDeluxColorScheme.surface,
  );
  static final p4MOceanTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _P4MColorScheme.p4MOceanColorScheme,
    // textTheme: _TextTheme._textLightTheme,
    fontFamily: "Roboto",
    appBarTheme: _AppBarTheme._appBarOcean,
    scaffoldBackgroundColor: _P4MColorScheme.p4MAmericaColorScheme.surface,
  );

  static final p4MNatureTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _P4MColorScheme.p4MNatureColorScheme,
    // textTheme: _TextTheme._textDarkTheme,
    fontFamily: "Roboto",
    appBarTheme: _AppBarTheme._appBarNature,
    scaffoldBackgroundColor: _P4MColorScheme.p4MDeluxColorScheme.surface,
  );
  static final p4MLispTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _P4MColorScheme.p4MLispColorScheme,
    // textTheme: _TextTheme._textLightTheme,
    fontFamily: "Roboto",
    appBarTheme: _AppBarTheme._appBarLisp,
    scaffoldBackgroundColor: _P4MColorScheme.p4MAmericaColorScheme.surface,
  );

  static final p4MAuthorTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _P4MColorScheme.p4MAuthorColorScheme,
    // textTheme: _TextTheme._textDarkTheme,
    fontFamily: "Roboto",
    appBarTheme: _AppBarTheme._appBarAuthor,
    scaffoldBackgroundColor: _P4MColorScheme.p4MDeluxColorScheme.surface,
  );
}

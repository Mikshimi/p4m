part of 'app_theme.dart';

// @immutable
class _P4MColorScheme {
  static const _p4MLightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _P4MColors.deepTeal,
    onPrimary: Colors.white,
    secondary: _P4MColors.deepYellow,
    onSecondary: Colors.black,
    tertiaryContainer: _P4MColors.deepSilver,
    onTertiaryContainer: _P4MColors.white,
    error: Colors.red,
    onError: _P4MColors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  static const _p4MDarkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: _P4MColors.deepTeal,
    onPrimary: Colors.black,
    secondary: _P4MColors.deepYellow,
    onSecondary: Colors.white,
    tertiaryContainer: _P4MColors.deepSilver,
    onTertiaryContainer: _P4MColors.black,
    error: Colors.redAccent,
    onError: Colors.black,
    surface: Colors.black,
    onSurface: Colors.white,
  );
}

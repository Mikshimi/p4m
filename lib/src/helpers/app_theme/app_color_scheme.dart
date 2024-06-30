part of 'app_theme.dart';

class _P4MColorScheme {
  //Light Color Schemes
  static ColorScheme p4MAmericaColorScheme = ColorScheme.fromSeed(
      seedColor: P4MColors.americaLight.elementAt(4),
      brightness: Brightness.light,
      primary: P4MColors.americaNavyD,
      secondary: P4MColors.americaWhiteL,
      tertiary: P4MColors.americaRedD,
      );

  static ColorScheme p4MDeluxColorScheme = ColorScheme.fromSeed(
      seedColor: P4MColors.deluxLight.elementAt(0),
      brightness: Brightness.light,
      primary: P4MColors.deluxLightBlueL,
      secondary: P4MColors.deluxPerperPinkL,
      tertiary: P4MColors.deluxHeavyPinkL);

  static ColorScheme p4MLispColorScheme = ColorScheme.fromSeed(
      seedColor: P4MColors.lispLight.elementAt(0),
      brightness: Brightness.light,
      primary: P4MColors.lispBlackD,
      secondary: P4MColors.lispRedishD,
      tertiary: P4MColors.lispOffGreyD);

  //Dark Color Schemes
  static ColorScheme p4MOceanColorScheme = ColorScheme.fromSeed(
      seedColor: P4MColors.oceanDark.elementAt(0),
      brightness: Brightness.dark,
      primary: P4MColors.oceanDeepBlueD,
      secondary: P4MColors.oceanShoreBlueD,
      tertiary: P4MColors.lispRedishD);
  static ColorScheme p4MNatureColorScheme = ColorScheme.fromSeed(
      seedColor: P4MColors.natureDark.elementAt(0),
      brightness: Brightness.dark);
  static ColorScheme p4MAuthorColorScheme = ColorScheme.fromSeed(
      seedColor: P4MColors.authorDark.elementAt(1),
      brightness: Brightness.dark);
}

part of 'app_theme.dart';

class P4MColors {
  /*
  A collection of color scheme options 
  ('D' trail means that text would use white'ish color
   'L' trail means that text would use black'ish color)
  Part 1: America Light Mode
    mix of dark light colors
  */
  static const Color americaWhiteL = Color(0XFFFFFFFF);
  static const Color americaSkyBlueL = Color(0XFFA8DADC);
  static const Color americaMidSkyBlueD = Color(0XFF457B9D);
  static const Color americaNavyD = Color(0XFF1D3557);
  static const Color americaRedD = Color(0XFFE63946);
  static const List<Color> americaLight = [
    americaWhiteL,
    americaSkyBlueL,
    americaMidSkyBlueD,
    americaNavyD,
    americaRedD
  ];

  /*
  Part 2: Delux Light Mode
   mix of light colors
  */
  static const Color deluxPurpleL = Color(0XFFCDB4DB);
  static const Color deluxPerperPinkL = Color(0XFFFFC8DD);
  static const Color deluxHeavyPinkL = Color(0XFFDDADCC);
  static const Color deluxLightBlueL = Color(0XFFBDE0FE);
  static const Color deluxdarkerBlueL = Color(0XFFA2D2FF);
  static const List<Color> deluxLight = [
    deluxPurpleL,
    deluxPerperPinkL,
    deluxHeavyPinkL,
    deluxLightBlueL,
    deluxdarkerBlueL
  ];

  /*
  Part 3: The Ocean (Dark Mode)
     mix of light and dark colors
  */

  static const Color oceanDeepBlueD = Color(0XFF04080F);
  static const Color oceanShoreBlueD = Color(0XFF507DBC);
  static const Color oceanBelowSurfaceL = Color(0XFFA1C6EA);
  static const Color oceanSurfaceL = Color(0XFFBBD1EA);
  static const Color oceanSprayL = Color(0XFFDAE3E5);
  static const List<Color> oceanDark = [
    oceanDeepBlueD,
    oceanShoreBlueD,
    oceanBelowSurfaceL,
    oceanSurfaceL,
    oceanSprayL
  ];

  /*
  Part 4: Nature's Calls Dark Mode
     mix of light and dark colors
  */

  static const Color natureDeepGreenD = Color(0XFF283618);
  static const Color natureVerdantD = Color(0XFF606C38);
  static const Color natureClayD = Color(0XFFBC6C25);
  static const Color natureTanL = Color(0XFFDDA15E);
  static const Color natureLimeL = Color(0XFFFFFFFF);
  static const List<Color> natureDark = [
    natureDeepGreenD,
    natureVerdantD,
    natureClayD,
    natureTanL,
    natureLimeL
  ];

  /*
  Part 5: Lisping Light Mode
     mix of light and dark colors
  */

  static const Color lispGoldenL = Color(0XFFFCA311);
  static const Color lispBlackD = Color(0XFF000000);
  static const Color lispOffGreyD = Color(0XFF202C33);
  static const Color lispRedishD = Color(0XFF6E0D25);
  static const Color lispWhiteishL = Color(0XFFFBFEF9);
  static const List<Color> lispLight = [
    lispGoldenL,
    lispBlackD,
    lispOffGreyD,
    lispRedishD,
    lispWhiteishL
  ];

  /*
  Part 6: Authors Notes Dark Mode
     mix of light and dark colors
  */

  static const Color authorDarkPeachD = Color(0XFFE07A5F);
  static const Color authorBlueHueD = Color(0XFF3D405B);
  static const Color authorPlumL = Color(0XFFF2CC8F);
  static const Color authorTealL = Color(0XFF81B29A);
  static const Color authorLightHouseL = Color(0XFFF3F1DE);
  static const List<Color> authorDark = [
    authorDarkPeachD,
    authorBlueHueD,
    authorPlumL,
    authorTealL,
    authorLightHouseL
  ];
}

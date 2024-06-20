import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class Dimensions {
  //ratio classes

  //Color palette size
  static final double colorPaleteBorder = 22.h;

  static final double colorPaletteHight = 44.h;
  static final double colorPaletteWidth = 44.w;
  // icon Size
  static final double iconSizeLarge = 36.h;

  static final double iconSizeLarger = 48.h;
  static final double iconSizeLargest = 80.h;
  static final double iconSizeMedium = 30.h;
  static final double iconSizeSmall = 24.h;
  static final double iconSizeSmallest = 16.h;

  static final double p4mEntryTextFieldSize = 35.h;

  //BorderRadius -?? avatar, profile etc note container no borders

  static final p4mBorderRadiusAllLarge = BorderRadius.circular(30).w;
  static final p4mBorderRadiusAllLarger = BorderRadius.circular(50).w;
  static final p4mBorderRadiusAllMedium = BorderRadius.circular(20).w;
  static final p4mBorderRadiusAllSmall = BorderRadius.circular(16).w;
  static final p4mBorderRadiusAllSmallest = BorderRadius.circular(6).w;

  static final p4mBottomNavBarMargin = const EdgeInsets.symmetric(
    horizontal: 50.0,
    vertical: 20.0,
  ).w;

  //Padding > all
  static final p4mPaddingAllLarge = const EdgeInsets.all(20.0).w;
  static final p4mPaddingAllLarger = const EdgeInsets.all(30.0).w;
  static final p4mPaddingAllLargest = const EdgeInsets.all(50.0).w;
  static final p4mPaddingAllMedium = const EdgeInsets.all(10.0).w;
  static final p4mPaddingAllSmall = const EdgeInsets.all(8.0).w;

  //Padding > horizontal
  static final p4mPaddingHorizontalLarge = const EdgeInsets.symmetric(
    horizontal: 20.0,
  ).w;

  static final p4mPaddingHorizontalMedium = const EdgeInsets.symmetric(
    horizontal: 16.0,
  ).w;

  static final p4mPaddingHorizontalSmall = const EdgeInsets.symmetric(
    horizontal: 10.0,
  ).w;

  static final p4mPaddingNavBottom = const EdgeInsets.all(16.0).w;
  static const p4mPaddingSearchTextField = EdgeInsetsDirectional.all(12.0);
  static final p4mPaddingVerticalLarge = const EdgeInsets.symmetric(
    vertical: 20.0,
  ).w;

  static final p4mPaddingVerticalMedium = const EdgeInsets.symmetric(
    vertical: 20.0,
  ).w;

  //Container
  static final double p4mCardFooterHigh = 50.h;

  static final p4mTextSettingHeight = 0.055.sh;
  static final p4mRadiusAllSmallest = const Radius.circular(6).w;

  //Screen Size
  static final p4mScreenHeight = 100.sh;
  static final p4mScreenWidth = 100.sw;

  //Fractions of Screen Size usefull for
  static final p4mScreenHeight30 = 0.3.sh;
  static final p4mScreenHeight40 = 0.4.sh;
  static final p4mScreenHeight50 = 0.5.sh;
  static final p4mScreenWidth30 = 0.3.sw;
  static final p4mScreenWidth50 = 0.5.sw;
  static final p4mScreenWidth60 = 0.6.sw;

  //P4M  Text font size
  static final double prayerTextFontSizeLarge = 24.sp;
  static final double prayerTextFontSizeMedium = 20.sp;
  static final double prayerTextFontSizeSmall = 16.sp;

  //P4M letter Spacing
  static final double prayerTextLetterSpacingLarge = 10.w;
  static final double prayerTextLetterSpacingMedium = 6.w;
  static final double prayerTextLetterSpacingNone = 0.w;
  static final double prayerTextLetterSpacingSmall = 3.w;

  //P4M Word Spacing
  static final double prayerTextWordSpacingLarge = 12.w;
  static final double prayerTextWordSpacingMedium = 9.w;
  static final double prayerTextWordSpacingNone = 0.w;
  static final double prayerTextWordSpacingSmall = 6.w;

  static final double sizeLarge = 18.h;
  static final double sizeLarger = 20.h;
  static final double sizeLargest = 50.h;
  static final double sizeMedium = 16.h;
  static final double sizeSmall = 12.h;
  static final double sizeSmaller = 8.h;
  static final double sizeSmallest = 6.h;

  //Horizontal Spacecers
  static final p4mHorizontalSpaceLarge = SizedBox(width: 20.w);
  static final p4mHorizontalSpaceLarger = SizedBox(width: 24.w);
  static final p4mHorizontalSpaceLargest = SizedBox(width: 30.w);
  static final p4mHorizontalSpaceMedium = SizedBox(width: 16.w);
  static final p4mHorizontalSpaceSmall = SizedBox(width: 10.w);
  static final p4mHorizontalSpaceSmaller = SizedBox(width: 8.w);

  //Vertical spacers
  static final p4mVerticalSpaceLarge = SizedBox(height: 30.h);
  static final p4mVerticalSpaceLarger = SizedBox(height: 50.h);
  static final p4mVerticalSpaceLargest = SizedBox(height: 100.h);
  static final p4mVerticalSpaceMedium = SizedBox(height: 20.h);
  static final p4mVerticalSpaceSmall = SizedBox(height: 16.h);
  static final p4mVerticalSpaceSmaller = SizedBox(height: 10.h);
  static final p4mVerticalSpaceSmallest = SizedBox(height: 8.h);
}

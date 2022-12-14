import 'package:flutter/material.dart';

import 'colors_app.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get primaryFont => 'Poppins';
  String get secondaryFont => 'MPlus1P';

  // primary font
  TextStyle get textPrimaryFontRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: primaryFont);

  TextStyle get textPrimaryFontMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: primaryFont);

  TextStyle get textPrimaryFontSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: primaryFont);

  TextStyle get textPrimaryFontBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: primaryFont);

  TextStyle get textPrimaryFontExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: primaryFont);

  // secondary font
  TextStyle get textSecondaryFontRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: secondaryFont);

  TextStyle get textSecondaryFontMedium =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: secondaryFont);

  TextStyle get textSecondaryFontBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: secondaryFont);

  TextStyle get textSecondaryFontExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: secondaryFont);

  TextStyle get labelTextField =>
      textSecondaryFontRegular.copyWith(color: ColorsApp.instance.darkGrey);

  TextStyle get textSecondaryFontExtraBoldPrimaryColor =>
      textSecondaryFontExtraBold.copyWith(color: ColorsApp.instance.primary);

  TextStyle get titleWhite => textPrimaryFontBold.copyWith(
        fontSize: 22,
        color: Colors.white,
      );

  TextStyle get titleBlack => textPrimaryFontBold.copyWith(
        fontSize: 22,
        color: Colors.black,
      );

  TextStyle get titlePrimaryColor => textPrimaryFontBold.copyWith(
        fontSize: 22,
        color: ColorsApp.instance.primary,
      );
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}

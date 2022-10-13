import 'package:flutter/material.dart';
import 'package:wca_flutter_app/app/core/styles/colors_app.dart';
import 'package:wca_flutter_app/app/core/styles/text_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(18),
    borderSide: BorderSide(
      color: ColorsApp.instance.darkGrey,
      width: 1,
    ),
  );

  static final theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyles.instance.textPrimaryFontBold.copyWith(
        color: Colors.black,
        fontSize: 18,
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    primaryColor: ColorsApp.instance.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instance.primary,
      primary: ColorsApp.instance.primary,
      secondary: ColorsApp.instance.secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: TextStyles.instance.labelTextField,
    ),
  );
}

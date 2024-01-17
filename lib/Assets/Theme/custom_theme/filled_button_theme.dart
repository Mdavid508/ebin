import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:flutter/material.dart';

class MyAppFilledButtonTheme{
  MyAppFilledButtonTheme._();

  static final lightFilledButtonTheme = FilledButtonThemeData(style: FilledButton.styleFrom(
    backgroundColor: MyAppColors.primaryColor,
    foregroundColor: MyAppColors.surfaceLightColor,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    textStyle: MyAppTextTheme.lightTheme.labelLarge,
    fixedSize: const Size.fromWidth(250),
  ));
  // static final darkFilledButtonTheme = FilledButtonThemeData(

  // );//dark themefilledbutton

} 
import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:flutter/material.dart';

class MyAppOutlinedButtonTheme {
  MyAppOutlinedButtonTheme._();

  static final lightOutlinedTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          foregroundColor: MyAppColors.primaryColor,
          textStyle: MyAppTextTheme.lightTheme.labelLarge,
          side: const BorderSide(color: MyAppColors.outline)));
}

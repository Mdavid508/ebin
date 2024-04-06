import 'package:ebin/constants/colors.dart';
import 'package:flutter/material.dart';

class MyAppFloatingActionButtonTheme {
  MyAppFloatingActionButtonTheme._();
  static const lightFloatingActionButton = FloatingActionButtonThemeData(
    backgroundColor: MyAppColors.surfaceLightColor,
    extendedTextStyle: TextStyle(color: MyAppColors.primaryColor),
    foregroundColor: MyAppColors.primaryColor,
  );
}

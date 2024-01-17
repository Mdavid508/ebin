import 'package:ebin/constants/colors.dart';
import 'package:flutter/material.dart';

class MyAppNavigationBarTheme {
  MyAppNavigationBarTheme._();

  static const lightNavigationBarTheme = NavigationBarThemeData(
    backgroundColor: MyAppColors.surfaceLightColor,
    indicatorColor: MyAppColors.onSurfaceLightColor,
    labelTextStyle:
        MaterialStatePropertyAll(TextStyle(color: MyAppColors.onSurface)),
    iconTheme:
        MaterialStatePropertyAll(IconThemeData(color: MyAppColors.onSurface)),
  );
}

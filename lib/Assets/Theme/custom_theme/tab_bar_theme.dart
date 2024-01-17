import 'package:ebin/constants/colors.dart';
import 'package:flutter/material.dart';

class MyAppTabBarTheme {
  MyAppTabBarTheme._();

  static const lightThemeTabBar = TabBarTheme(
    labelColor: MyAppColors.primaryColor,
    indicatorColor: MyAppColors.primaryColor,
    indicatorSize: TabBarIndicatorSize.label,
    unselectedLabelColor: MyAppColors.onSurfaceVariant,
    dividerColor: MyAppColors.surfaceVariant,
  );
}

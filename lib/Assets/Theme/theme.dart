import 'package:ebin/Assets/Theme/custom_theme/chips_theme.dart';
import 'package:ebin/Assets/Theme/custom_theme/outlined_button_theme.dart';
import 'package:ebin/Assets/Theme/custom_theme/tab_bar_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/Assets/Theme/custom_theme/filled_button_theme.dart';
import 'package:ebin/Assets/Theme/custom_theme/navigation_bar_theme.dart';

class MyAppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyAppTextTheme.lightTheme,
    filledButtonTheme: MyAppFilledButtonTheme.lightFilledButtonTheme,
    navigationBarTheme: MyAppNavigationBarTheme.lightNavigationBarTheme,
    tabBarTheme: MyAppTabBarTheme.lightThemeTabBar,
    chipTheme: MyAppChipTheme.lightChipTheme,
    outlinedButtonTheme: MyAppOutlinedButtonTheme.lightOutlinedTheme,
    primaryColor: MyAppColors.primaryColor,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyAppTextTheme.darkTheme,
    primaryColor: Colors.green,
  );
}

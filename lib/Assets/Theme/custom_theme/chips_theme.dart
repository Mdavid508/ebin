import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:flutter/material.dart';

class MyAppChipTheme {
  MyAppChipTheme._();

  static const lightChipTheme = ChipThemeData(
      color: MaterialStatePropertyAll(Colors.transparent),
      backgroundColor: Colors.transparent,
      selectedColor: MyAppColors.secondaryContainer,
      side: BorderSide(color: MyAppColors.onSurfaceVariant),
      labelStyle: TextStyle(color: MyAppColors.onSecondaryContainer),
      iconTheme: IconThemeData(color: MyAppColors.onSecondaryContainer));
}

import 'package:ebin/constants/colors.dart';
import 'package:flutter/material.dart';

class MyAppTextField {
  MyAppTextField._();

  static const lightTextField = InputDecorationTheme(
    focusedBorder: OutlineInputBorder(),
    fillColor: MyAppColors.outline,
    focusColor: MyAppColors.outline,
    border: OutlineInputBorder(),
    labelStyle: TextStyle(color: MyAppColors.onSurfaceVariant),
  );
}

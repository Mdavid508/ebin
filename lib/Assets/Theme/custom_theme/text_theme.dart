import 'package:flutter/material.dart';

class MyAppTextTheme {
  MyAppTextTheme._();

  static TextTheme darkTheme = TextTheme(
    //display theme
    displayLarge: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 57,
        fontWeight: FontWeight.w500,
        color: Colors.white),
    displayMedium: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 45,
        fontWeight: FontWeight.w500,
        color: Colors.white),
    displaySmall: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 36,
        fontWeight: FontWeight.w500,
        color: Colors.white),

    //headline theme
    headlineLarge: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 32,
        fontWeight: FontWeight.normal,
        color: Colors.white),
    headlineMedium: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 28,
        fontWeight: FontWeight.normal,
        color: Colors.white),
    headlineSmall: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: Colors.white),

    //Title theme
    titleLarge: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 22,
        fontWeight: FontWeight.normal,
        color: Colors.white),
    titleMedium: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white),
    titleSmall: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white),

    //Body theme
    bodyLarge: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white),
    bodyMedium: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.white),
    bodySmall: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white),

    //label theme
    labelLarge: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white),
    labelMedium: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.white),
    labelSmall: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: Colors.white),
  );

  static TextTheme lightTheme = TextTheme(
    //display theme
    displayLarge: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 57,
        fontWeight: FontWeight.w500,
        color: Colors.black),
    displayMedium: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 45,
        fontWeight: FontWeight.w500,
        color: Colors.black),
    displaySmall: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 36,
        fontWeight: FontWeight.w500,
        color: Colors.black),

    //headline theme
    headlineLarge: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 32,
        fontWeight: FontWeight.normal,
        color: Colors.black),
    headlineMedium: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 28,
        fontWeight: FontWeight.normal,
        color: Colors.black),
    headlineSmall: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: Colors.black),

    //Title theme
    titleLarge: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 22,
        fontWeight: FontWeight.normal,
        color: Colors.black),
    titleMedium: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black),
    titleSmall: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black),

    //Body theme
    bodyLarge: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.black),
    bodyMedium: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black),
    bodySmall: const TextStyle().copyWith(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black),

    //label theme
    labelLarge: const TextStyle().copyWith(
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: const TextStyle().copyWith(
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: const TextStyle().copyWith(
      fontFamily: 'Poppins',
      fontSize: 11,
      fontWeight: FontWeight.w600,
    ),
  );
}

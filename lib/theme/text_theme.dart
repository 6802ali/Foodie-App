import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 27,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 27,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    ),
  );
}

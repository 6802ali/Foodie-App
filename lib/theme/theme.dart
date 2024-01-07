import 'package:flutter/material.dart';
import 'package:foodie/theme/appbar_theme.dart';
import 'package:foodie/theme/text_field_theme.dart';
import 'package:foodie/theme/text_theme.dart';
import 'bottom_sheet_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF10B981),
        backgroundColor: const Color(0xFFD1FAE5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(256, 49),
      ),
    ),
    appBarTheme: TAppBarTheme.lightAppTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    inputDecorationTheme: TTextFieldTheme.lightTextFieldTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.black87,
    textTheme: TTextTheme.darkTextTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF10B981),
        backgroundColor: const Color(0xFFD1FAE5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(256, 49),
      ),
    ),
    appBarTheme: TAppBarTheme.darkAppTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: TTextFieldTheme.darkTextFieldTheme,
  );
}

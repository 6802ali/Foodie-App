import 'package:flutter/material.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme =
      const BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    constraints: BoxConstraints(
      minWidth: double.infinity,
    ),
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
    ),
  );

  static BottomSheetThemeData darkBottomSheetTheme = const BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black,
    constraints: BoxConstraints(
      minWidth: double.infinity,
    ),
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
    ),
  );
}

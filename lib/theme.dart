import 'package:flutter/material.dart';

class CustomAppTheme {
  static const Color primaryColor = Color(0xff3e8b3a);
  static const String fontFamily = 'Andika';
  static const Color fontColor = Color(0xff3C3C3C);
  static const Color secondryColor = Color(0xfff4f4f4);
  static const Color offWhite = Color(0xfffafafa);

  static TextStyle mediumTitle = const TextStyle(
      color: fontColor, fontWeight: FontWeight.w400, fontSize: 24);

  static TextStyle largeDisplay = const TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w400,
      fontFamily: 'LilitaOne',
      letterSpacing: 4.80,
      fontSize: 48);

  static TextStyle largeButtonText = const TextStyle(
    color: offWhite,
    fontSize: 25,
    fontWeight: FontWeight.w400,
  );

  static const AppBarTheme appBarTheme = AppBarTheme(
      backgroundColor: Colors.transparent, elevation: 0, toolbarHeight: 70);
}

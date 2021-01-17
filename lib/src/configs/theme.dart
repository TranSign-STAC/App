import 'package:flutter/material.dart';

class TransignColors {
  static const Color BackgroundColor = Color(0xFFFBFBFF);
  static const int _PrimaryColorValue = 0xFF5446F6;
  static const MaterialColor PrimaryColor = MaterialColor(
    _PrimaryColorValue,
    <int, Color>{
      100: Color(0xFFB3E5FC),
      200: Color(0xFFEEECFE),
      300: Color(0xFFCCC7FC),
      400: Color(0xFFBBB5FB),
      500: Color(0xFFA9A3FB),
      600: Color(0xFF9890FA),
      700: Color(0xFF877EF9),
      800: Color(0xFF768BF8),
      900: Color(0xFF5446F7),
    },
  );

  static const int _BlackScale = 0xFF000000;
  static const MaterialColor BlackScale = MaterialColor(
    _BlackScale,
    <int, Color>{
      100: Color(0xFFE5E5E5),
      200: Color(0xFFCCCCCC),
      300: Color(0xFFB3B3B3),
      400: Color(0xFFB3B3B3),
      500: Color(0xFF808080),
      600: Color(0xFF666666),
      700: Color(0xFF4D4D4D),
      800: Color(0xFF333333),
      900: Color(0xFF1A1A1A),
    },
  );

  static const int _SubGreen = 0xFF50EE8F;
  static const MaterialColor SubGreen = MaterialColor(
    _SubGreen,
    <int, Color>{
      100: Color(0xFFEDFDF4),
      200: Color(0xFFDCFCE9),
      300: Color(0xFFC8FADE),
      400: Color(0xFFB9F8DE),
      500: Color(0xFFA8F7C7),
      600: Color(0xFF96F5BC),
      700: Color(0xFF85F3B1),
      800: Color(0xFF73F1A6),
      900: Color(0xFF62F09B),
    },
  );

  static const int _SubRed = 0xFFF16565;
  static const MaterialColor SubRed = MaterialColor(
    _SubRed,
    <int, Color>{
      100: Color(0xFFFEF0F0),
      200: Color(0xFFFCE0E0),
      300: Color(0xFFFBD1D1),
      400: Color(0xFFF9C2C2),
      500: Color(0xFFF8B2B2),
      600: Color(0xFFF7A3A3),
      700: Color(0xFFF59494),
      800: Color(0xFFF48484),
      900: Color(0xFFF37575),
    },
  );
}

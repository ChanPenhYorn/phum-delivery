import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors {
  /// Primary with no dark mode
  static final Color basePrimary = HexColor('#FEF1F4');

  ///
  static final Color primary = HexColor('#CA1043');
  static final Color secondary = HexColor('#0088FF');
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static final Color gray = Colors.grey;
  static final Color lightGray = HexColor('#F2F4F7');

  // Primary Colors
  static const Color primaryLight = Colors.blue;
  static const Color primaryDark = Colors.deepPurple;

  // Secondary Colors
  static const Color secondaryLight = Colors.green;
  static const Color secondaryDark = Colors.teal;

  // Background Colors
  static const Color backgroundLight = Colors.white;
  static const Color backgroundDark = Color(0xFF121212);

  // Surface Colors
  static const Color surfaceLight = Colors.white;
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // Error Colors
  static const Color errorLight = Colors.red;
  static const Color errorDark = Colors.redAccent;

  // Text Colors
  static const Color onPrimaryLight = Colors.white;
  static const Color onPrimaryDark = Colors.white;

  static const Color onBackgroundLight = Colors.black;
  static const Color onBackgroundDark = Colors.white;

  static const Color onSurfaceLight = Colors.black;
  static const Color onSurfaceDark = Colors.white;

  static const Color onErrorLight = Colors.white;
  static const Color onErrorDark = Colors.black;
}

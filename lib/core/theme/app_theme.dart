import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const ocean = Color(0xFF0B3D5E);
  static const oceanMid = Color(0xFF1A6B8A);
  static const aqua = Color(0xFF00D4C8);
  static const aquaDim = Color(0xFF0A9E8A);
  static const sand = Color(0xFFF2F0ED);
  static const sandBorder = Color(0xFFE4E0D8);
  static const dark = Color(0xFF0B1F2E);
  static const muted = Color(0xFF9BA3AF);
  static const white = Color(0xFFFFFFFF);
}

ThemeData buildAppTheme() => ThemeData(
      colorSchemeSeed: AppColors.ocean,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      scaffoldBackgroundColor: AppColors.sand,
      useMaterial3: true,
    );

TextStyle headingStyle({
  double size = 20,
  FontWeight weight = FontWeight.w600,
}) =>
    GoogleFonts.fraunces(
      fontSize: size,
      fontWeight: weight,
      color: AppColors.white,
    );

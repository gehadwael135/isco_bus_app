
import 'package:flutter/material.dart';

import 'app_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

 
  // Display
  

  static const TextStyle displayLarge = TextStyle(
    fontFamily: AppFonts.defaultFont,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: AppFonts.defaultFont,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  // ============================================================
  // Headline
  

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: AppFonts.defaultFont,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: AppFonts.defaultFont,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: AppFonts.defaultFont,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  // ============================================================
  // Title
  

  static const TextStyle titleLarge = TextStyle(
    fontFamily: AppFonts.defaultFont,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: AppFonts.defaultFont,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: AppFonts.defaultFont,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  // ============================================================
  // Body
  

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: AppFonts.defaultFont,
    fontSize: 16,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppFonts.defaultFont,
    fontSize: 14,
    
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.defaultFont,
    fontSize: 12,
  );

  // ============================================================
  // Label
  

  static const TextStyle labelLarge = TextStyle(
    fontFamily: AppFonts.defaultFont,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: AppFonts.defaultFont,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: AppFonts.defaultFont,
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );
}
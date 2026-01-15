import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seguromedico/core/theme/app_color.dart';

class AppTextStyles {
  // ========== DISPLAY TEXT ==========
  static TextStyle displayExtraLarge({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 45,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle displayLarge({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 40,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle displayMedium({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle displaySmall({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.textPrimary,
      );

  // ========== HEADLINE TEXT ==========
  static TextStyle headlineLarge({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle headlineMedium({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle headlineSmall({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.textPrimary,
      );

  // ========== TITLE TEXT ==========
  static TextStyle titleLarge({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle titleMedium({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle titleSmall({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColors.textPrimary,
      );

  // ========== BODY TEXT ==========
  static TextStyle bodyLarge({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle bodyMedium({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle bodySmall({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? AppColors.textSecondary,
      );

  // ========== LABEL TEXT ==========
  static TextStyle labelLarge({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle labelMedium({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle labelSmall({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColors.textSecondary,
      );

  // ========== BUTTON TEXT ==========
  static TextStyle buttonLarge({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? Colors.white,
        letterSpacing: 0.5,
      );

  static TextStyle buttonMedium({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? Colors.white,
        letterSpacing: 0.5,
      );

  static TextStyle buttonSmall({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? Colors.white,
        letterSpacing: 0.5,
      );

  // ========== INPUT TEXT ==========
  static TextStyle inputText({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle inputLabel({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle inputHint({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? AppColors.textSecondary.withOpacity(0.6),
      );

  static TextStyle inputError({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? Colors.red,
      );

  // El resto de los métodos permanecen iguales para el ThemeData...
  static TextTheme get textTheme => TextTheme(
        displayLarge: displayLarge(),
        displayMedium: displayMedium(),
        displaySmall: displaySmall(),
        headlineLarge: headlineLarge(),
        headlineMedium: headlineMedium(),
        headlineSmall: headlineSmall(),
        titleLarge: titleLarge(),
        titleMedium: titleMedium(),
        titleSmall: titleSmall(),
        bodyLarge: bodyLarge(),
        bodyMedium: bodyMedium(),
        bodySmall: bodySmall(),
        labelLarge: labelLarge(),
        labelMedium: labelMedium(),
        labelSmall: labelSmall(),
      );
}

import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/custom_colors.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static const String fontFamily = 'Lexend';

  // ==============================
  // ☀️ LIGHT THEME
  // ==============================
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
      primaryColor: AppColors.lightPrimary,
      dialogBackgroundColor: AppColors.lightDialogBackground,
      
      // -- Color Scheme --
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightPrimary,
        secondary: AppColors.lightSecondary,
        surface: AppColors.lightScaffoldBackground,
        onSurfaceVariant: AppColors.lightOnSurfaceVariant,
        outline: AppColors.lightOutline,
      ),

      // -- Theme Extensions --
      extensions: const <ThemeExtension<dynamic>>[
        CustomColors(
          mainTextColor: AppColors.lightMainTextColor,
          secondaryTextColor: AppColors.lightSecondaryTextColor,
          formColor: AppColors.lightFormColor,
          toastColor: AppColors.lightToastBackground,
          cachedNetworkImagePlaceholderColor: AppColors.lightCachedNetworkImagePlacholderColor,
        ),
      ],

      // -- UI Components Theme --
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightPrimary,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightFormColor,
        hintStyle: const TextStyle(color: AppColors.lightSecondaryTextColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.lightOutline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.lightPrimary, width: 1.5),
        ),
        prefixIconColor: AppColors.lightSecondaryTextColor,
        suffixIconColor: AppColors.lightSecondaryTextColor,
      ),
    );
  }

  // ==============================
  // 🌙 DARK THEME
  // ==============================
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
      primaryColor: AppColors.darkPrimary,
      dialogBackgroundColor: AppColors.darkDialogBackground,

      // -- Color Scheme --
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkPrimary,
        secondary: AppColors.darkSecondary,
        surface: AppColors.darkSurface, 
        onSurfaceVariant: AppColors.darkOnSurfaceVariant,
        outline: AppColors.darkOutline,
      ),

      // -- Theme Extensions --
      extensions: const <ThemeExtension<dynamic>>[
        CustomColors(
          mainTextColor: AppColors.darkMainTextColor,
          secondaryTextColor: AppColors.darkSecondaryTextColor,
          formColor: AppColors.darkFormColor,
          toastColor: AppColors.darkToastBackground,
          cachedNetworkImagePlaceholderColor: AppColors.darkCachedNetworkImagePlacholderColor,
        ),
      ],

      // -- UI Components Theme --
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkPrimary,
          foregroundColor: AppColors.darkMainTextColor,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkFormColor,
        hintStyle: const TextStyle(color: AppColors.darkSecondaryTextColor),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkOutline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkPrimary, width: 1.5),
        ),
        prefixIconColor: AppColors.darkSecondaryTextColor,
        suffixIconColor: AppColors.darkSecondaryTextColor,
      ),
    );
  }
}
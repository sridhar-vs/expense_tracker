import 'package:expense_tracker/core/constraints/app_colors.dart';
import 'package:expense_tracker/core/constraints/app_fonts.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static final ThemeData themeData = ThemeData(
    fontFamily: AppFonts.inter,
    primaryColor: AppColors.primaryColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.white,
      selectionColor: AppColors.buttonColor.withValues(alpha: 0.3),
      selectionHandleColor: AppColors.white,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.all(16)),
        iconColor: WidgetStatePropertyAll(AppColors.primaryColor),
        backgroundColor: WidgetStatePropertyAll(AppColors.buttonColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        backgroundColor: WidgetStatePropertyAll(AppColors.buttonColor),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.secondary,
      filled: true,
      hintStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.inputHintTextColor,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(width: 0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(width: 0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 0, color: AppColors.secondary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 0, color: AppColors.secondary),
      ),
    ),
  );
}

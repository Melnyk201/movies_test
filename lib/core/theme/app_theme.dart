import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light => _build(
        brightness: Brightness.light,
        background: AppColors.background,
        searchBackground: AppColors.searchBackground,
        textColor: AppColors.text,
        secondaryButtonBackground: AppColors.buttonSecondaryBackgroundLight,
      );

  static ThemeData get dark => _build(
        brightness: Brightness.dark,
        background: AppColors.backgroundDark,
        searchBackground: AppColors.searchBackgroundDark,
        textColor: AppColors.textDark,
        secondaryButtonBackground: AppColors.buttonSecondaryBackgroundDark,
      );

  static ThemeData _build({
    required Brightness brightness,
    required Color background,
    required Color searchBackground,
    required Color textColor,
    required Color secondaryButtonBackground,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      textTheme: GoogleFonts.robotoTextTheme().apply(
        bodyColor: textColor,
        displayColor: textColor,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.buttonPrimaryBackground,
        brightness: brightness,
        primary: AppColors.buttonPrimaryBackground,
        onPrimary: AppColors.buttonPrimaryText,
        surface: background,
        onSurface: textColor,
        surfaceContainerHighest: searchBackground,
      ),
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: textColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleSpacing: 16,
        iconTheme: IconThemeData(color: textColor, size: 24),
      ),
    );
  }
}

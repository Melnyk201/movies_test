import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme().apply(
          bodyColor: AppColors.text,
          displayColor: AppColors.text,
        ),
        colorScheme: ColorScheme.light(
          primary: AppColors.buttonPrimaryBackground,
          onPrimary: AppColors.buttonPrimaryText,
          surface: AppColors.background,
          onSurface: AppColors.text,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.text,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleSpacing: 16,
          iconTheme: IconThemeData(
            color: AppColors.text,
            size: 24,
          ),
        ),
      );

  // static ThemeData get dark => ...
}

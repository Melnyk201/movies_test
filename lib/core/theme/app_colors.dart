import 'package:flutter/material.dart';

abstract final class AppColors {
  // Light
  static const Color background = Color(0xFFFFFFFF);
  static const Color searchBackground = Color(0xFFF1F1F1);
  static const Color text = Color(0xFF111111);

  // Dark
  static const Color backgroundDark = Color(0xFF111111);
  static const Color searchBackgroundDark = Color(0xFF2A2A2A);
  static const Color textDark = Color(0xFFFFFFFF);

  // Shared
  static const Color favorite = Color(0xFFF2C94C);
  static const Color star = Color(0xFFFFFFFF);
  static const Color title = Color(0xFFFFFFFF);

  // Primary button (yellow) — однакова в обох темах
  static const Color buttonPrimaryBackground = Color(0xFFF2C94C);
  static const Color buttonPrimaryText = Color(0xFF111111);

  // Secondary button
  static const Color buttonSecondaryBackgroundLight = Color(0xFF111111);
  static const Color buttonSecondaryBackgroundDark = Color(0xFFFFFFFF);
  static const Color buttonSecondaryText = Color(0xFFFFFFFF);
}

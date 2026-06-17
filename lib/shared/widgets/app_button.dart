import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

enum AppButtonStyle { filled, outlined }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.style = AppButtonStyle.filled,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonStyle style;

  @override
  Widget build(BuildContext context) {
    final isFilled = style == AppButtonStyle.filled;
    final themeTextColor = Theme.of(context).colorScheme.onSurface;
    final textColor = isFilled ? AppColors.buttonPrimaryText : themeTextColor;

    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor:
              isFilled ? AppColors.buttonPrimaryBackground : Colors.transparent,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: isFilled
                ? BorderSide.none
                : BorderSide(color: themeTextColor, width: 1),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

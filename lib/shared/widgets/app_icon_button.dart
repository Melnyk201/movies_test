import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_test/core/theme/app_colors.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.assetPath,
    required this.onPressed,
    this.size = 24,
    this.color = AppColors.text,
  });

  final String assetPath;
  final VoidCallback onPressed;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        assetPath,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}

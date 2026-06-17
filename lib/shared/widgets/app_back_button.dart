import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_test/core/theme/app_colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: SvgPicture.asset(
        'assets/icons/Back_Icon.svg',
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(
          AppColors.text,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

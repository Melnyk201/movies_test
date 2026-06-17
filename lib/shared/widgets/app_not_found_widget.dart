import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_test/core/theme/app_colors.dart';

class AppNotFoundWidget extends StatelessWidget {
  const AppNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SvgPicture.asset(
        'assets/icons/no_found.svg',
        width: 120,
        height: 120,
        colorFilter: ColorFilter.mode(
          AppColors.text.withValues(alpha: 0.7),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

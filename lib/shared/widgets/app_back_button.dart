import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;

    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: SvgPicture.asset(
        'assets/icons/Back_Icon.svg',
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}

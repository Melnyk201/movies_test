import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.assetPath,
    required this.onPressed,
    this.size = 24,
  });

  final String assetPath;
  final VoidCallback onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface;

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

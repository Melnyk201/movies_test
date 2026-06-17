import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key, this.size = 80});

  final double size;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.hexagonDots(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
      size: size,
    );
  }
}

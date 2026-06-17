import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_test/core/theme/app_colors.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.hexagonDots(
          color: AppColors.text,
          size: 80,
        ),
      ),
    );
  }
}

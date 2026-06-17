import 'package:flutter/material.dart';
import 'package:movies_test/core/constants/app_dimensions.dart';

class AppContentPadding extends StatelessWidget {
  const AppContentPadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.contentPadding,
      child: child,
    );
  }
}

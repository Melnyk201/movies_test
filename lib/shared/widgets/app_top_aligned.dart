import 'package:flutter/material.dart';
import 'package:movies_test/core/constants/app_dimensions.dart';

class AppTopAligned extends StatelessWidget {
  const AppTopAligned({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimensions.emptyStatePadding,
      child: Align(
        alignment: Alignment.topCenter,
        child: child,
      ),
    );
  }
}

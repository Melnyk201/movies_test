import 'package:flutter/material.dart';

abstract final class AppDimensions {
  static const double horizontalPadding = 16;
  static const double topPadding = 8;
  static const double emptyStateTopPadding = 94;

  static const contentPadding = EdgeInsets.only(
    left: horizontalPadding,
    right: horizontalPadding,
    top: topPadding,
  );

  static const emptyStatePadding = EdgeInsets.only(
    top: emptyStateTopPadding,
  );
}

import 'package:flutter/material.dart';
import 'package:movies_test/core/theme/app_colors.dart';

class MovieDetailOverview extends StatelessWidget {
  const MovieDetailOverview({super.key, required this.overview});

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Text(
      overview,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.text.withValues(alpha: 0.8),
        height: 1.5,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_test/core/theme/app_colors.dart';

class MovieDetailRating extends StatelessWidget {
  const MovieDetailRating({super.key, required this.voteAverage});

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Rating: ${voteAverage.toStringAsFixed(0)}',
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColors.text,
      ),
    );
  }
}

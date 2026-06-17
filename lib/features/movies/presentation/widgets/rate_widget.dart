import 'package:flutter/widgets.dart';
import 'package:movies_test/core/theme/app_colors.dart';

class RateWidget extends StatelessWidget {
  final double voteAverage;
  const RateWidget({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Rating: ${voteAverage.toStringAsFixed(0)}',
      style: TextStyle(
        color: AppColors.text,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

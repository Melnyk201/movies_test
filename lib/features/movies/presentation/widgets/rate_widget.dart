import 'package:flutter/widgets.dart';


class RateWidget extends StatelessWidget {
  final double voteAverage;
  const RateWidget({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Rating: ${voteAverage.toStringAsFixed(0)}',
      style: TextStyle(
      
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MovieDetailOverview extends StatelessWidget {
  const MovieDetailOverview({super.key, required this.overview});

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Text(
      overview,
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    );
  }
}

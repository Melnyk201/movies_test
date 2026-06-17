import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  final String movieId;

  const MovieDetailsPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Movie Details')),
    );
  }
}

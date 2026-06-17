import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieDetailReleaseDate extends StatelessWidget {
  const MovieDetailReleaseDate({super.key, required this.releaseDate});

  final String releaseDate;

  String _formatDate(String raw) {
    try {
      final date = DateTime.parse(raw);
      return DateFormat('d MMMM yyyy').format(date);
    } catch (_) {
      return raw;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatDate(releaseDate),
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    );
  }
}

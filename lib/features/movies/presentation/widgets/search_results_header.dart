import 'package:flutter/material.dart';

class SearchResultsHeader extends StatelessWidget {
  const SearchResultsHeader({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Search results ($count)',
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

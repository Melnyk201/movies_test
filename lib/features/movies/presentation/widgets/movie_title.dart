import 'package:flutter/widgets.dart';

class MovieTitle extends StatelessWidget {
  final String title;
  const MovieTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    );
  }
}

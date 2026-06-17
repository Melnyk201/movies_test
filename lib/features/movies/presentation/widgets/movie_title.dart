import 'package:flutter/widgets.dart';
import 'package:movies_test/core/theme/app_colors.dart';

class MovieTitle extends StatelessWidget {
  final String title;
  const MovieTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: AppColors.text,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

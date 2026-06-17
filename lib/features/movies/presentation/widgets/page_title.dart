import 'package:flutter/widgets.dart';
import 'package:movies_test/core/theme/app_colors.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Movie',
      style: TextStyle(
        color: AppColors.text,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

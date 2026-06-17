import 'package:flutter/widgets.dart';
import 'package:movies_test/core/theme/app_colors.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: TextStyle(
        color: AppColors.text,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

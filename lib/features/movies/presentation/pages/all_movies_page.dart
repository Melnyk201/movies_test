import 'package:flutter/material.dart';
import 'package:movies_test/shared/widgets/app_button.dart';

class AllMoviesPage extends StatelessWidget {
  const AllMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              label: 'Watch now',
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            AppButton(
              label: 'Add to list',
              onPressed: () {},
              style: AppButtonStyle.outlined,
            ),
          ],
        ),
      ),
    );
  }
}

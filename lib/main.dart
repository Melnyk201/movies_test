import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_test/core/di/injection_container.dart';
import 'package:movies_test/core/theme/app_theme.dart';
import 'package:movies_test/router/app_router.dart';

void main() {
  setupDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Movies',
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}

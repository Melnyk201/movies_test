import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_test/core/di/injection_container.dart';
import 'package:movies_test/core/theme/providers/theme_provider.dart';
import 'package:movies_test/router/app_router.dart';

void main() {
  setupDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider).theme;

    return MaterialApp.router(
      title: 'Movies',
      theme: theme,
      routerConfig: appRouter,
    );
  }
}

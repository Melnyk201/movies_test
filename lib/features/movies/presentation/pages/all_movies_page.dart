import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_test/features/movies/presentation/providers/movies_provider.dart';
import 'package:movies_test/features/movies/presentation/widgets/movies_grid.dart';
import 'package:movies_test/router/app_router.dart';
import 'package:movies_test/core/theme/providers/theme_provider.dart';
import 'package:movies_test/shared/widgets/app_content_padding.dart';
import 'package:movies_test/shared/widgets/app_error_widget.dart';
import 'package:movies_test/shared/widgets/app_icon_button.dart';
import 'package:movies_test/shared/widgets/app_loading_indicator.dart';
import 'package:movies_test/shared/widgets/app_pagination.dart';
import 'package:movies_test/shared/widgets/page_title.dart';

class AllMoviesPage extends ConsumerWidget {
  const AllMoviesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(moviesProvider);
    final state = notifier.state;
    final isDark = ref.watch(themeProvider).isDark;

    return Scaffold(
      appBar:
          state.status == MoviesStatus.data
              ? AppBar(
                title: PageTitle(title: 'Movie'),
                actions: [
                  AppIconButton(
                    assetPath: 'assets/icons/search.svg',
                    onPressed: () => context.push(AppRoutes.searchMovie),
                  ),
                  AppIconButton(
                    assetPath:
                        isDark
                            ? 'assets/icons/sun.svg'
                            : 'assets/icons/moon.svg',
                    onPressed: () => ref.read(themeProvider).toggle(),
                  ),
                  const SizedBox(width: 4),
                ],
              )
              : null,
      body: AppContentPadding(
        child: switch (state.status) {
          MoviesStatus.initial ||
          MoviesStatus.loading => const Center(child: AppLoadingIndicator()),
          MoviesStatus.error => Center(
            child: AppErrorWidget(
              message: state.errorMessage ?? 'Unknown error',
              onRetry: () => ref.read(moviesProvider).loadTopRated(),
            ),
          ),
          MoviesStatus.data => Column(
            children: [
              Expanded(child: MoviesGrid(movies: state.movies)),

              Padding(
                padding: const EdgeInsets.only(top: 26, bottom: 34),
                child: AppPagination(
                  currentPage: state.currentPage,
                  totalPages: state.totalPages,
                  onPageChanged:
                      (page) =>
                          ref.read(moviesProvider).loadTopRated(page: page),
                ),
              ),
            ],
          ),
        },
      ),
    );
  }
}

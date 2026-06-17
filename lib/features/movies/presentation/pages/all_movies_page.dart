import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_test/core/constants/app_dimensions.dart';
import 'package:movies_test/shared/widgets/app_loading_widget.dart';
import 'package:movies_test/features/movies/presentation/providers/movies_provider.dart';
import 'package:movies_test/features/movies/presentation/widgets/movie_card.dart';
import 'package:movies_test/features/movies/presentation/widgets/page_title.dart';
import 'package:movies_test/shared/widgets/app_error_widget.dart';
import 'package:movies_test/shared/widgets/app_icon_button.dart';

class AllMoviesPage extends ConsumerWidget {
  const AllMoviesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(moviesProvider);
    final state = notifier.state;

    return switch (state.status) {
      MoviesStatus.loading => const AppLoadingWidget(),
      MoviesStatus.error => Scaffold(
        body: AppErrorWidget(
          message: state.errorMessage ?? 'Unknown error',
          onRetry: () => ref.read(moviesProvider).loadTopRated(),
        ),
      ),
      MoviesStatus.data => Scaffold(
        appBar: AppBar(
          title: PageTitle(),
          
          actions: [
            AppIconButton(
              assetPath: 'assets/icons/search.svg',
              onPressed: () {},
            ),
            AppIconButton(assetPath: 'assets/icons/sun.svg', onPressed: () {}),
            const SizedBox(width: 4),
          ],
        ),
        body: GridView.builder(
          padding: AppDimensions.contentPadding,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: MovieCard.cardHeight,
          ),
          itemCount: state.movies.length,
          itemBuilder:
              (context, index) => MovieCard(movie: state.movies[index]),
        ),
      ),
    };
  }
}

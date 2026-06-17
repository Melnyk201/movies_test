import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_test/shared/widgets/app_loading_indicator.dart';
import 'package:movies_test/features/movie/presentation/providers/movie_details_provider.dart';
import 'package:movies_test/features/movie/presentation/widgets/movie_detail_content.dart';
import 'package:movies_test/shared/widgets/app_back_button.dart';
import 'package:movies_test/shared/widgets/app_error_widget.dart';
import 'package:movies_test/shared/widgets/app_top_aligned.dart';
import 'package:movies_test/shared/widgets/page_title.dart';

class MovieDetailsPage extends ConsumerWidget {
  final int movieId;

  const MovieDetailsPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(movieDetailsProvider(movieId));
    final state = notifier.state;

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title:
            state.status == MovieDetailsStatus.data && state.movie != null
                ? PageTitle(title: state.movie!.title)
                : null,
      ),
      body: switch (state.status) {
        MovieDetailsStatus.loading => const AppTopAligned(
            child: AppLoadingIndicator(),
          ),
        MovieDetailsStatus.error => AppTopAligned(
            child: AppErrorWidget(
              message: state.errorMessage ?? 'Unknown error',
              onRetry: notifier.retry,
            ),
          ),
        MovieDetailsStatus.data => MovieDetailContent(
          movie: state.movie!,
          isFavorite: notifier.isFavorite,
          onToggleFavorite: notifier.toggleFavorite,
        ),
      },
    );
  }
}

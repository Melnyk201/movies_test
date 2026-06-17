import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_test/core/constants/app_dimensions.dart';
import 'package:movies_test/core/theme/app_colors.dart';
import 'package:movies_test/features/movies/presentation/models/movies_state.dart';
import 'package:movies_test/features/movies/presentation/providers/search_provider.dart';
import 'package:movies_test/features/movies/presentation/widgets/movie_card.dart';
import 'package:movies_test/shared/widgets/app_back_button.dart';
import 'package:movies_test/shared/widgets/app_error_widget.dart';
import 'package:movies_test/shared/widgets/app_not_found_widget.dart';
import 'package:movies_test/shared/widgets/app_search_field.dart';
import 'package:movies_test/shared/widgets/page_title.dart';

class SearchMoviePage extends ConsumerStatefulWidget {
  const SearchMoviePage({super.key});

  @override
  ConsumerState<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends ConsumerState<SearchMoviePage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(searchProvider);
    final state = notifier.state;

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        centerTitle: false,
        title: PageTitle(title: 'Search'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.horizontalPadding,
            ),
            child: AppSearchField(
              controller: _controller,
              onChanged:
                  (query) => ref.read(searchProvider).onSearchChanged(query),
            ),
          ),
          const SizedBox(height: 16),
          if (state.status == MoviesStatus.data)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.horizontalPadding,
              ),
              child: Text(
                'Search results (${state.movies.length})',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          
          Expanded(
            child: switch (state.status) {
              MoviesStatus.initial => const SizedBox.shrink(),
              MoviesStatus.loading => Padding(
                  padding: const EdgeInsets.only(top: 94),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: LoadingAnimationWidget.hexagonDots(
                      color: AppColors.text,
                      size: 48,
                    ),
                  ),
                ),
              MoviesStatus.error => Padding(
                  padding: const EdgeInsets.only(top: 94),
                  child: AppErrorWidget(
                    message: state.errorMessage ?? 'Unknown error',
                    onRetry: () =>
                        ref.read(searchProvider).retry(_controller.text),
                  ),
                ),
              MoviesStatus.data => state.movies.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.only(top: 94),
                      child: AppNotFoundWidget(),
                    )
                  : GridView.builder(
                      padding: AppDimensions.contentPadding,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        mainAxisExtent: MovieCard.cardHeight,
                      ),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) =>
                          MovieCard(movie: state.movies[index]),
                    ),
            },
          ),
        ],
      ),
    );
  }
}

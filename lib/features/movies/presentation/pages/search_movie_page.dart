import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_test/shared/widgets/app_loading_indicator.dart';
import 'package:movies_test/features/movies/presentation/providers/search_provider.dart';
import 'package:movies_test/features/movies/presentation/widgets/movies_grid.dart';
import 'package:movies_test/features/movies/presentation/widgets/search_results_header.dart';
import 'package:movies_test/shared/widgets/app_back_button.dart';
import 'package:movies_test/shared/widgets/app_content_padding.dart';
import 'package:movies_test/shared/widgets/app_error_widget.dart';
import 'package:movies_test/shared/widgets/app_not_found_widget.dart';
import 'package:movies_test/shared/widgets/app_search_field.dart';
import 'package:movies_test/shared/widgets/app_top_aligned.dart';
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
        title: PageTitle(title: 'Search'),
      ),
      body: AppContentPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            AppSearchField(
              controller: _controller,
              onChanged:
                  (query) => ref.read(searchProvider).onSearchChanged(query),
            ),

            Expanded(child: _buildBody(state)),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(MoviesState state) {
    if (state.status == MoviesStatus.data) {
      return _buildDataState(state);
    }

    return switch (state.status) {
      MoviesStatus.initial => const SizedBox.shrink(),
      MoviesStatus.loading => const AppTopAligned(
        child: AppLoadingIndicator(size: 48),
      ),
      MoviesStatus.error => AppTopAligned(
        child: AppErrorWidget(
          message: state.errorMessage ?? 'Unknown error',
          onRetry: () => ref.read(searchProvider).retry(_controller.text),
        ),
      ),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _buildDataState(MoviesState state) {
    if (state.movies.isEmpty) {
      return const AppTopAligned(child: AppNotFoundWidget());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        SearchResultsHeader(count: state.movies.length),

        Expanded(child: MoviesGrid(movies: state.movies)),
      ],
    );
  }
}

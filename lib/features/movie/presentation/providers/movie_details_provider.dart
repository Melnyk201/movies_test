import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_test/core/di/injection_container.dart';
import 'package:movies_test/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:movies_test/features/movie/domain/repositories/movie_detail_repository.dart';
import 'package:movies_test/features/movie/presentation/models/movie_details_state.dart';

export 'package:movies_test/features/movie/presentation/models/movie_details_state.dart';

class MovieDetailsNotifier extends ChangeNotifier {
  MovieDetailsNotifier({
    required int movieId,
    required FavoritesNotifier favoritesNotifier,
  })  : _movieId = movieId,
        _favoritesNotifier = favoritesNotifier {
    _favoritesNotifier.addListener(_onFavoritesChanged);
    _fetchDetails();
  }

  final int _movieId;
  final FavoritesNotifier _favoritesNotifier;
  final MovieDetailRepository _repository = getIt<MovieDetailRepository>();

  MovieDetailsState state = const MovieDetailsState();

  bool get isFavorite => _favoritesNotifier.isFavorite(_movieId);

  Future<void> _fetchDetails() async {
    state = const MovieDetailsState(status: MovieDetailsStatus.loading);
    notifyListeners();

    try {
      final movie = await _repository.getMovieDetails(movieId: _movieId);
      state = MovieDetailsState(
        status: MovieDetailsStatus.data,
        movie: movie,
      );
    } catch (e) {
      state = MovieDetailsState(
        status: MovieDetailsStatus.error,
        errorMessage: e.toString(),
      );
    }

    notifyListeners();
  }

  Future<void> retry() => _fetchDetails();

  Future<void> toggleFavorite() async {
    if (state.movie != null) {
      await _favoritesNotifier.toggle(state.movie!);
    }
  }

  void _onFavoritesChanged() => notifyListeners();

  @override
  void dispose() {
    _favoritesNotifier.removeListener(_onFavoritesChanged);
    super.dispose();
  }
}

final movieDetailsProvider =
    ChangeNotifierProvider.family<MovieDetailsNotifier, int>(
  (ref, movieId) => MovieDetailsNotifier(
    movieId: movieId,
    favoritesNotifier: ref.watch(favoritesProvider),
  ),
);

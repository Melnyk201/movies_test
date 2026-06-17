import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_test/core/di/injection_container.dart';
import 'package:movies_test/features/movies/domain/repositories/movie_repository.dart';
import 'package:movies_test/features/movies/presentation/models/movies_state.dart';

export 'package:movies_test/features/movies/presentation/models/movies_state.dart';

class MoviesNotifier extends ChangeNotifier {
  MoviesNotifier() {
    loadTopRated();
  }

  final MoviesRepository _repository = getIt<MoviesRepository>();
  MoviesState state = const MoviesState();

  Future<void> loadTopRated() async {
    state = state.copyWith(status: MoviesStatus.loading);
    notifyListeners();
    try {
      final result = await _repository.getTopRated(page: 1);
      state = state.copyWith(status: MoviesStatus.data, movies: result.results);
    } catch (e) {
      state = state.copyWith(
        status: MoviesStatus.error,
        errorMessage: e.toString(),
      );
    }
    notifyListeners();
  }

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) {
      await loadTopRated();
      return;
    }
    state = state.copyWith(status: MoviesStatus.loading);
    notifyListeners();
    try {
      final result = await _repository.searchMovies(query: query);
      state = state.copyWith(status: MoviesStatus.data, movies: result.results);
    } catch (e) {
      state = state.copyWith(
        status: MoviesStatus.error,
        errorMessage: e.toString(),
      );
    }
    notifyListeners();
  }
}

final moviesProvider = ChangeNotifierProvider<MoviesNotifier>(
  (ref) => MoviesNotifier(),
);

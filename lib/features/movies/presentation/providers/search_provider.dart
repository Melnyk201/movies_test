import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_test/core/di/injection_container.dart';
import 'package:movies_test/features/movies/domain/repositories/movie_repository.dart';
import 'package:movies_test/features/movies/presentation/models/movies_state.dart';

export 'package:movies_test/features/movies/presentation/models/movies_state.dart';

class SearchNotifier extends ChangeNotifier {
  final MoviesRepository _repository = getIt<MoviesRepository>();

  MoviesState state = const MoviesState(status: MoviesStatus.initial);
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void onSearchChanged(String query) {
    _debounce?.cancel();

    if (query.length < 3) {
      state = const MoviesState(status: MoviesStatus.initial);
      notifyListeners();
      return;
    }

    state = state.copyWith(status: MoviesStatus.loading);
    notifyListeners();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchMovies(query);
    });
  }

  Future<void> _searchMovies(String query) async {
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

  void retry(String query) => _searchMovies(query);
}

final searchProvider = ChangeNotifierProvider<SearchNotifier>(
  (ref) => SearchNotifier(),
);

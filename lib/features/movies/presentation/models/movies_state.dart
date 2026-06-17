import 'package:movies_test/shared/models/movie_model.dart';

enum MoviesStatus { initial, loading, data, error }

class MoviesState {
  const MoviesState({
    this.status = MoviesStatus.loading,
    this.movies = const [],
    this.errorMessage,
    this.currentPage = 1,
    this.totalPages = 1,
  });

  final MoviesStatus status;
  final List<MovieModel> movies;
  final String? errorMessage;
  final int currentPage;
  final int totalPages;

  MoviesState copyWith({
    MoviesStatus? status,
    List<MovieModel>? movies,
    String? errorMessage,
    int? currentPage,
    int? totalPages,
  }) {
    return MoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      errorMessage: errorMessage ?? this.errorMessage,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}

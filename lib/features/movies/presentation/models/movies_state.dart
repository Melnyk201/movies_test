import 'package:movies_test/shared/models/movie_model.dart';

enum MoviesStatus { loading, data, error }

class MoviesState {
  const MoviesState({
    this.status = MoviesStatus.loading,
    this.movies = const [],
    this.errorMessage,
  });

  final MoviesStatus status;
  final List<MovieModel> movies;
  final String? errorMessage;

  MoviesState copyWith({
    MoviesStatus? status,
    List<MovieModel>? movies,
    String? errorMessage,
  }) {
    return MoviesState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

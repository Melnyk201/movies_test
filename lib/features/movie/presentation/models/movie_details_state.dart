import 'package:movies_test/shared/models/movie_model.dart';

enum MovieDetailsStatus { loading, data, error }

class MovieDetailsState {
  const MovieDetailsState({
    this.status = MovieDetailsStatus.loading,
    this.movie,
    this.errorMessage,
  });

  final MovieDetailsStatus status;
  final MovieModel? movie;
  final String? errorMessage;

  MovieDetailsState copyWith({
    MovieDetailsStatus? status,
    MovieModel? movie,
    String? errorMessage,
  }) {
    return MovieDetailsState(
      status: status ?? this.status,
      movie: movie ?? this.movie,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

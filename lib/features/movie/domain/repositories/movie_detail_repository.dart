import 'package:movies_test/shared/models/movie_model.dart';

abstract interface class MovieDetailRepository {
  Future<MovieModel> getMovieDetails({required int movieId});
}

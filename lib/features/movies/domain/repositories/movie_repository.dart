import 'package:movies_test/shared/models/movie_list_model.dart';

abstract interface class MoviesRepository {
  Future<MovieListModel> getTopRated({required int page});

  Future<MovieListModel> searchMovies({
    required String query,
    int page = 1,
  });
}

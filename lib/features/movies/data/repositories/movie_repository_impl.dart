import 'package:movies_test/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movies_test/shared/models/movie_list_model.dart';
import 'package:movies_test/features/movies/domain/repositories/movie_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource _remoteDataSource;

  MoviesRepositoryImpl(this._remoteDataSource);

  @override
  Future<MovieListModel> getTopRated({required int page}) =>
      _remoteDataSource.getTopRated(page: page);

  @override
  Future<MovieListModel> searchMovies({
    required String query,
    int page = 1,
  }) =>
      _remoteDataSource.searchMovies(query: query, page: page);
}

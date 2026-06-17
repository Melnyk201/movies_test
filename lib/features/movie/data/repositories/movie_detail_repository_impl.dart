import 'package:movies_test/features/movie/data/datasources/movie_detail_remote_data_source.dart';
import 'package:movies_test/features/movie/domain/repositories/movie_detail_repository.dart';
import 'package:movies_test/shared/models/movie_model.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  final MovieDetailRemoteDataSource _remoteDataSource;

  MovieDetailRepositoryImpl(this._remoteDataSource);

  @override
  Future<MovieModel> getMovieDetails({required int movieId}) =>
      _remoteDataSource.getMovieDetails(movieId: movieId);
}

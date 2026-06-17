import 'package:dio/dio.dart';
import 'package:movies_test/core/constants/api_constants.dart';
import 'package:movies_test/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movies_test/shared/models/movie_list_model.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final Dio _dio;

  MoviesRemoteDataSourceImpl(this._dio);

  @override
  Future<MovieListModel> getTopRated({required int page}) async {
    final response = await _dio.get(
      ApiConstants.topRated,
      queryParameters: {'page': page},
    );
    return MovieListModel.fromJson(response.data);
  }

  @override
  Future<MovieListModel> searchMovies({
    required String query,
    int page = 1,
  }) async {
    final response = await _dio.get(
      ApiConstants.searchMovie,
      queryParameters: {'query': query, 'page': page},
    );
    return MovieListModel.fromJson(response.data);
  }
}

import 'package:dio/dio.dart';
import 'package:movies_test/core/constants/api_constants.dart';
import 'package:movies_test/features/movie/data/datasources/movie_detail_remote_data_source.dart';
import 'package:movies_test/shared/models/movie_model.dart';

class MovieDetailRemoteDataSourceImpl implements MovieDetailRemoteDataSource {
  final Dio _dio;

  MovieDetailRemoteDataSourceImpl(this._dio);

  @override
  Future<MovieModel> getMovieDetails({required int movieId}) async {
    final response = await _dio.get(ApiConstants.movieDetails(movieId));
    return MovieModel.fromJson(response.data);
  }
}

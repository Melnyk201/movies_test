import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_test/core/network/dio_client.dart';
import 'package:movies_test/features/movie/data/datasources/movie_detail_remote_data_source.dart';
import 'package:movies_test/features/movie/data/datasources/movie_detail_remote_data_source_impl.dart';
import 'package:movies_test/features/movie/data/repositories/movie_detail_repository_impl.dart';
import 'package:movies_test/features/movie/domain/repositories/movie_detail_repository.dart';
import 'package:movies_test/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movies_test/features/movies/data/datasources/movie_remote_data_source_impl.dart';
import 'package:movies_test/features/movies/data/repositories/movie_repository_impl.dart';
import 'package:movies_test/features/movies/domain/repositories/movie_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<Dio>(createDio());

  getIt.registerSingleton<MoviesRemoteDataSource>(
    MoviesRemoteDataSourceImpl(getIt<Dio>()),
  );
  getIt.registerSingleton<MoviesRepository>(
    MoviesRepositoryImpl(getIt<MoviesRemoteDataSource>()),
  );

  getIt.registerSingleton<MovieDetailRemoteDataSource>(
    MovieDetailRemoteDataSourceImpl(getIt<Dio>()),
  );
  getIt.registerSingleton<MovieDetailRepository>(
    MovieDetailRepositoryImpl(getIt<MovieDetailRemoteDataSource>()),
  );
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_test/core/network/dio_client.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<Dio>(createDio());
}

import 'package:dio/dio.dart';
import 'package:movies_test/core/constants/api_constants.dart';

Dio createDio() {
  return Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {
        'Authorization': 'Bearer ${ApiConstants.bearerToken}',
        'accept': 'application/json',
      },
    ),
  );
}

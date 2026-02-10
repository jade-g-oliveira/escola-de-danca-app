import 'package:dio/dio.dart';

import '../constants/app_constants.dart';

class ApiClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'User-Agent': 'PostmanRuntime/7.32.3',
        'Accept': '*/*',
      },
    ),
  );

  static Dio get instance => _dio;
}
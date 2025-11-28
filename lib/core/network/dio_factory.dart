import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:recipe_app/core/network/api_urls.dart';

class DioFactory {
  static Dio createDio() {
    const timeOut = Duration(seconds: 30);

    final dio = Dio()
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut;
    dio.options.baseUrl = ApiUrls.baseUrl;

    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        enabled: kDebugMode,
      ),
    );

    return dio;
  }
}

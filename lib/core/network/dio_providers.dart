import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'dio_factory.dart';

part 'dio_providers.g.dart';

@riverpod
Dio dio(Ref ref) {
  return DioFactory.createDio();
}

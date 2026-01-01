import 'package:dio/dio.dart';

import '../../../../core/network/api_result.dart';
import '../entities/meal.dart';

abstract class SearchRepository {
  Future<ApiResult<List<Meal>>> searchMeals(
    String query, {
    CancelToken? cancelToken,
  });
}

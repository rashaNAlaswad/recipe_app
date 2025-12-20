import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_urls.dart';
import '../models/meal_detail_model.dart';

part 'meal_remote_data_source.g.dart';

@RestApi()
abstract class MealApiService {
  factory MealApiService(Dio dio) = _MealApiService;

  @GET(ApiUrls.mealDetail)
  Future<MealDetailResponse> getMealDetail(@Query('i') String mealId);
}

class MealRemoteDataSource {
  final MealApiService _apiService;

  MealRemoteDataSource(this._apiService);

  Future<ApiResult<MealDetailResponse>> getMealDetail(String mealId) async {
    try {
      final response = await _apiService.getMealDetail(mealId);
      return Success(response);
    } catch (error) {
      final errorMessage = ApiErrorHandler.handle(error).message;
      return Failure(errorMessage ?? "Unknown error occurred");
    }
  }
}

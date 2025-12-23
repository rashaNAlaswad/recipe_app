import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_urls.dart';
import '../../../search/data/models/meals_response.dart';
import '../models/category_model.dart';

part 'category_remote_data_source.g.dart';

@RestApi()
abstract class CategoryApiService {
  factory CategoryApiService(Dio dio) = _CategoryApiService;

  @GET(ApiUrls.categories)
  Future<CategoriesResponse> getCategories();

  @GET(ApiUrls.filter)
  Future<MealsResponse> getMealsByCategory(@Query('c') String category);
}

class CategoryRemoteDataSource {
  final CategoryApiService _apiService;
  CategoryRemoteDataSource(this._apiService);

  Future<ApiResult<CategoriesResponse>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
      return Success(response);
    } catch (error) {
      final errorMessage = ApiErrorHandler.handle(error).message;
      return Failure(errorMessage ?? "Unknown error occurred");
    }
  }

  Future<ApiResult<MealsResponse>> getMealsByCategory(String category) async {
    try {
      final response = await _apiService.getMealsByCategory(category);
      return Success(response);
    } catch (error) {
      final errorMessage = ApiErrorHandler.handle(error).message;
      return Failure(errorMessage ?? "Unknown error occurred");
    }
  }
}

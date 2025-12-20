import 'package:dio/dio.dart';
import 'package:recipe_app/features/search/data/models/meals_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_error_handler.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/api_urls.dart';

part 'search_remote_data_source.g.dart';

@RestApi()
abstract class SearchApiService {
  factory SearchApiService(Dio dio) = _SearchApiService;

  @GET(ApiUrls.search)
  Future<MealsResponse> searchMeals(@Query('s') String query);
}

class SearchRemoteDataSource {
  final SearchApiService _apiService;

  SearchRemoteDataSource(this._apiService);

  Future<ApiResult<MealsResponse>> searchMeals(String query) async {
    try {
      final response = await _apiService.searchMeals(query);
      return Success(response);
    } catch (error) {
      final errorMessage = ApiErrorHandler.handle(error).message;
      return Failure(errorMessage ?? "Unknown error occurred");
    }
  }
}

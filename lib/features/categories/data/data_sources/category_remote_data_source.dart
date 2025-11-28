import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_urls.dart';
import '../models/category_model.dart';

part 'category_remote_data_source.g.dart';

@RestApi()
abstract class CategoryRemoteDataSource {
  factory CategoryRemoteDataSource(Dio dio) = _CategoryRemoteDataSource;

  @GET(ApiUrls.categories)
  Future<CategoriesResponse> getCategories();
}

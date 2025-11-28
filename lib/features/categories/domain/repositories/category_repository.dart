import '../../../../core/network/api_result.dart';
import '../../data/models/category_model.dart';

abstract class CategoryRepository {
  Future<ApiResult<CategoriesResponse>> getCategories();
}

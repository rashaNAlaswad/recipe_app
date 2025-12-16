import '../../../../core/network/api_result.dart';
import '../entities/category.dart';

abstract class CategoryRepository {
  Future<ApiResult<List<Category>>> getCategories();
}

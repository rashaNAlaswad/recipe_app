import '../../../../core/network/api_result.dart';
import '../../../search/domain/entities/meal.dart';
import '../entities/category.dart';

abstract class CategoryRepository {
  Future<ApiResult<List<Category>>> getCategories();
  Future<ApiResult<List<Meal>>> getMealsByCategory(String category);
}

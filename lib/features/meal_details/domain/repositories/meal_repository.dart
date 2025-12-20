import '../../../../core/network/api_result.dart';
import '../entities/meal_detail.dart';

abstract class MealRepository {
  Future<ApiResult<MealDetail>> getMealDetail(String mealId);
}

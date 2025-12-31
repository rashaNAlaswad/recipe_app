import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/api_result.dart';
import '../../di/meal_data_provider.dart';
import '../../domain/entities/meal_detail.dart';

part 'meal_providers.g.dart';

@riverpod
class MealDetailNotifier extends _$MealDetailNotifier {
  @override
  Future<MealDetail> build(String mealId) async {
    final result = ref.read(mealRepositoryProvider).getMealDetail(mealId);
    return result.then(_handleApiResult);
  }
}

MealDetail _handleApiResult(ApiResult<MealDetail> apiResult) {
  return switch (apiResult) {
    Success(data: final data) => data,
    Failure(error: final error) => throw Exception(error),
  };
}

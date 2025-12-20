import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/api_result.dart';
import '../../di/meal_data_provider.dart';
import '../../domain/entities/meal_detail.dart';

part 'meal_providers.g.dart';

@riverpod
class MealDetailNotifier extends _$MealDetailNotifier {
  @override
  Future<MealDetail> build(String mealId) async {
    final result = ref.watch(mealRepositoryProvider).getMealDetail(mealId);
    return result.then(_handleApiResult);
  }

  Future<void> refresh() async {
    final mealId = this.mealId;
    state = const AsyncValue.loading();
    final result = await ref.read(mealRepositoryProvider).getMealDetail(mealId);
    state = await AsyncValue.guard(() async => _handleApiResult(result));
  }
}

MealDetail _handleApiResult(ApiResult<MealDetail> apiResult) {
  return switch (apiResult) {
    Success(data: final data) => data,
    Failure(error: final error) => throw Exception(error),
  };
}

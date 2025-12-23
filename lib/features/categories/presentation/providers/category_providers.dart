import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_result.dart';
import '../../../search/domain/entities/meal.dart';
import '../../di/category_data_provider.dart';
import '../../domain/entities/category.dart';

part 'category_providers.g.dart';

@riverpod
class CategoriesNotifier extends _$CategoriesNotifier {
  @override
  Future<List<Category>> build() {
    final result = ref.watch(categoryRepositoryProvider).getCategories();
    return result.then(_handleApiResult);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await ref.read(categoryRepositoryProvider).getCategories();
      return _handleApiResult(result);
    });
  }

  List<Category> _handleApiResult(ApiResult<List<Category>> apiResult) {
    return switch (apiResult) {
      Success(data: final data) => data,
      Failure(error: final error) => throw Exception(error),
    };
  }
}

@riverpod
class MealsByCategoryNotifier extends _$MealsByCategoryNotifier {
  @override
  Future<List<Meal>> build(String category) {
    final result = ref
        .watch(categoryRepositoryProvider)
        .getMealsByCategory(category);
    return result.then(_handleApiResult);
  }

  List<Meal> _handleApiResult(ApiResult<List<Meal>> apiResult) {
    return switch (apiResult) {
      Success(data: final data) => data,
      Failure(error: final error) => throw Exception(error),
    };
  }
}

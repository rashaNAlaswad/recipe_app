import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/dio_providers.dart';
import '../data/data_sources/meal_remote_data_source.dart';
import '../data/repositories/meal_repository_impl.dart';
import '../domain/repositories/meal_repository.dart';

part 'meal_data_provider.g.dart';

@riverpod
MealRemoteDataSource mealRemoteDataSource(Ref ref) {
  final apiService = MealApiService(ref.watch(dioProvider));
  return MealRemoteDataSource(apiService);
}

@riverpod
MealRepository mealRepository(Ref ref) {
  final remoteDataSource = ref.watch(mealRemoteDataSourceProvider);
  return MealRepositoryImpl(remoteDataSource);
}

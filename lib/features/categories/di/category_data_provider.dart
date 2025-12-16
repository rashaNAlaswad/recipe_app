import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/dio_providers.dart';
import '../data/data_sources/category_remote_data_source.dart';
import '../data/repositories/category_repository_impl.dart';
import '../domain/repositories/category_repository.dart';

part 'category_data_provider.g.dart';

@riverpod
CategoryRemoteDataSource categoryRemoteDataSource(Ref ref) {
  final apiService = CategoryApiService(ref.watch(dioProvider));
  return CategoryRemoteDataSource(apiService);
}

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  final remoteDataSource = ref.watch(categoryRemoteDataSourceProvider);
  return CategoryRepositoryImpl(remoteDataSource);
}

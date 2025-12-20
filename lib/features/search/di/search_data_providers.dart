import 'package:recipe_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/dio_providers.dart';
import '../data/repositories/search_repository_impl.dart';
import '../domain/repositories/search_repository.dart';

part 'search_data_providers.g.dart';

@riverpod
SearchRemoteDataSource searchRemoteDataSource(Ref ref) {
  final apiService = SearchApiService(ref.watch(dioProvider));
  return SearchRemoteDataSource(apiService);
}

@riverpod
SearchRepository searchRepository(Ref ref) {
  final remoteDataSource = ref.watch(searchRemoteDataSourceProvider);
  return SearchRepositoryImpl(remoteDataSource);
}

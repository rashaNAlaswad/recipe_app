import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_result.dart';
import '../../di/search_data_providers.dart';
import '../../domain/entities/meal.dart';

part 'search_providers.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {
  String? _currentQuery;
  CancelToken? _cancelToken;

  @override
  Future<List<Meal>> build() async {
    ref.onDispose(() {
      _cancelToken?.cancel();
    });
    return [];
  }

  Future<void> search(String query) async {
    _cancelToken?.cancel();
    _cancelToken = null;

    if (query.isEmpty) {
      _currentQuery = null;
      state = const AsyncValue.data([]);
      return;
    }

    _currentQuery = query;
    _cancelToken = CancelToken();
    state = const AsyncValue.loading();

    final result = await ref
        .read(searchRepositoryProvider)
        .searchMeals(query, cancelToken: _cancelToken);

    if (_currentQuery == query && !(_cancelToken?.isCancelled ?? false)) {
      state = switch (result) {
        Success(data: final meals) => AsyncValue.data(meals),
        Failure(error: final error) => AsyncValue.error(
          error,
          StackTrace.current,
        ),
      };
    }
  }
}

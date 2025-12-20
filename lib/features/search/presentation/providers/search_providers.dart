import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_result.dart';
import '../../di/search_data_providers.dart';
import '../../domain/entities/meal.dart';

part 'search_providers.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {
  String? _currentQuery;

  @override
  Future<List<Meal>> build() async {
    return [];
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      _currentQuery = null;
      state = const AsyncValue.data([]);
      return;
    }

    _currentQuery = query;
    state = const AsyncValue.loading();

    final result = await ref.read(searchRepositoryProvider).searchMeals(query);

    if (_currentQuery == query) {
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

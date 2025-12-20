import '../../../../core/network/api_result.dart';
import '../../domain/entities/meal.dart';
import '../../domain/repositories/search_repository.dart';
import '../data_sources/search_remote_data_source.dart';
import '../mappers/meals_mapper.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResult<List<Meal>>> searchMeals(String query) async {
    final result = await remoteDataSource.searchMeals(query);
    return switch (result) {
      Success(data: final data) => Success(data.toEntityList()),
      Failure(error: final error) => Failure(error),
    };
  }
}

import '../../../../core/network/api_result.dart';
import '../../domain/entities/meal_detail.dart';
import '../../domain/repositories/meal_repository.dart';
import '../data_sources/meal_remote_data_source.dart';
import '../mappers/detail_mapper.dart';

class MealRepositoryImpl implements MealRepository {
  final MealRemoteDataSource remoteDataSource;

  MealRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResult<MealDetail>> getMealDetail(String mealId) async {
    final result = await remoteDataSource.getMealDetail(mealId);
    return switch (result) {
      Success(data: final data) => Success(data.meals!.first.toEntity()),
      Failure(error: final error) => Failure(error),
    };
  }
}

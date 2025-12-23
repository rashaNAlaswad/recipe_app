import '../../../../core/network/api_result.dart';
import '../../../search/data/mappers/meals_mapper.dart';
import '../../../search/domain/entities/meal.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../data_sources/category_remote_data_source.dart';
import '../mappers/category_mapper.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResult<List<Category>>> getCategories() async {
    final result = await remoteDataSource.getCategories();
    return switch (result) {
      Success(data: final data) => Success(data.categories.toEntityList()),
      Failure(error: final error) => Failure(error),
    };
  }

  @override
  Future<ApiResult<List<Meal>>> getMealsByCategory(String category) async {
    final result = await remoteDataSource.getMealsByCategory(category);
    return switch (result) {
      Success(data: final data) => Success(data.toEntityList()),
      Failure(error: final error) => Failure(error),
    };
  }
}

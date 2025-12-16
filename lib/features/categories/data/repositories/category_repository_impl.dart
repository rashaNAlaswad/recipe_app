import '../../../../core/network/api_result.dart';
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
      Success(data: final data) => Success(
        data.categories.toEntityList(),
      ),
      Failure(error: final error) => Failure(error),
    };
  }
}

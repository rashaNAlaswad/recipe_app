import '../../../../core/network/api_result.dart';
import '../../domain/repositories/category_repository.dart';
import '../data_sources/category_remote_data_source.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResult<CategoriesResponse>> getCategories() async {
    return remoteDataSource.getCategories();
  }
}

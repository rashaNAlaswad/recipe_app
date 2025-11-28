import '../../domain/entities/category.dart';
import '../models/category_model.dart';

class CategoryMapper {
  static Category toEntity(CategoryModel model) {
    return Category(
      id: model.categoryId,
      name: model.categoryName,
      imageUrl: model.categoryImage,
    );
  }

  static List<Category> toEntityList(List<CategoryModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}

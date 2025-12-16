import '../../domain/entities/category.dart';
import '../models/category_model.dart';

extension CategoryModelExtension on CategoryModel {
  Category toEntity() =>
      Category(id: categoryId, name: categoryName, imageUrl: categoryImage);
}

extension CategoryModelListExtension on List<CategoryModel> {
  List<Category> toEntityList() => map((e) => e.toEntity()).toList();
}

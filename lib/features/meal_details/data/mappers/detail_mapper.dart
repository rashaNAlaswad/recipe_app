import '../../domain/entities/meal_detail.dart';
import '../models/meal_detail_model.dart';

extension MealDetailModelExtension on MealDetailModel {
  MealDetail toEntity() => MealDetail(
    id: mealId ?? '',
    name: mealName ?? '',
    imageUrl: strMealThumb ?? '',
    instructions: strInstructions ?? '',
    category: strCategory ?? '',
    area: strArea ?? '',
    ingredients: [
      Ingredient(name: strIngredient1 ?? '', measure: strMeasure1 ?? ''),
      Ingredient(name: strIngredient2 ?? '', measure: strMeasure2 ?? ''),
      Ingredient(name: strIngredient3 ?? '', measure: strMeasure3 ?? ''),
      Ingredient(name: strIngredient4 ?? '', measure: strMeasure4 ?? ''),
      Ingredient(name: strIngredient5 ?? '', measure: strMeasure5 ?? ''),
      Ingredient(name: strIngredient6 ?? '', measure: strMeasure6 ?? ''),
    ],
  );
}

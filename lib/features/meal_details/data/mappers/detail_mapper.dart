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
      Ingredient(name: strIngredient7 ?? '', measure: strMeasure7 ?? ''),
      Ingredient(name: strIngredient8 ?? '', measure: strMeasure8 ?? ''),
      Ingredient(name: strIngredient9 ?? '', measure: strMeasure9 ?? ''),
      Ingredient(name: strIngredient10 ?? '', measure: strMeasure10 ?? ''),
      Ingredient(name: strIngredient11 ?? '', measure: strMeasure11 ?? ''),
      Ingredient(name: strIngredient12 ?? '', measure: strMeasure12 ?? ''),
      Ingredient(name: strIngredient13 ?? '', measure: strMeasure13 ?? ''),
      Ingredient(name: strIngredient14 ?? '', measure: strMeasure14 ?? ''),
      Ingredient(name: strIngredient15 ?? '', measure: strMeasure15 ?? ''),
      Ingredient(name: strIngredient16 ?? '', measure: strMeasure16 ?? ''),
      Ingredient(name: strIngredient17 ?? '', measure: strMeasure17 ?? ''),
      Ingredient(name: strIngredient18 ?? '', measure: strMeasure18 ?? ''),
      Ingredient(name: strIngredient19 ?? '', measure: strMeasure19 ?? ''),
      Ingredient(name: strIngredient20 ?? '', measure: strMeasure20 ?? ''),
    ],
  );
}

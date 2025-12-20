import '../../domain/entities/meal.dart';
import '../models/meals_response.dart';

extension MealsResponseExtension on MealsResponse {
  List<Meal> toEntityList() =>
      meals
          ?.map(
            (e) => Meal(
              id: e.idMeal ?? '',
              name: e.strMeal ?? '',
              imageUrl: e.strMealThumb ?? '',
            ),
          )
          .toList() ??
      [];
}

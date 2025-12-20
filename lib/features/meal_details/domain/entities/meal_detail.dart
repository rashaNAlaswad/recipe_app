import 'package:equatable/equatable.dart';

class MealDetail extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String instructions;
  final String category;
  final String area;
  final List<Ingredient> ingredients;

  const MealDetail({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.instructions,
    required this.category,
    required this.area,
    required this.ingredients,
  });

  @override
  List<Object> get props => [
    id,
    name,
    imageUrl,
    instructions,
    category,
    area,
    ingredients,
  ];
}

class Ingredient extends Equatable {
  final String name;
  final String measure;

  const Ingredient({required this.name, required this.measure});

  @override
  List<Object> get props => [name, measure];
}

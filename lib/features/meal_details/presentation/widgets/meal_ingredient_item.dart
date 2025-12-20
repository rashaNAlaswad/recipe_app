import 'package:flutter/cupertino.dart';
import '../../domain/entities/meal_detail.dart';

class MealIngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const MealIngredientItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(ingredient.name, style: const TextStyle(fontSize: 16)),
          ),
          Expanded(
            child: Text(
              ingredient.measure,
              style: TextStyle(
                fontSize: 14,
                color: CupertinoColors.secondaryLabel,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

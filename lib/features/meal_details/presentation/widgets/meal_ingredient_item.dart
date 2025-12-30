import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/theme_providers.dart';
import '../../domain/entities/meal_detail.dart';

class MealIngredientItem extends ConsumerWidget {
  final Ingredient ingredient;

  const MealIngredientItem({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
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
                color: isDarkMode
                    ? AppTheme.darkSecondaryText
                    : AppTheme.lightSecondaryText,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

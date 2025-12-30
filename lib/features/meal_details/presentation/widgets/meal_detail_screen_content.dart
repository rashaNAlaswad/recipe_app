import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/theme_providers.dart';
import '../../domain/entities/meal_detail.dart';
import 'meal_ingredient_item.dart';

class MealDetailScreenContent extends ConsumerWidget {
  const MealDetailScreenContent({
    super.key,
    required this.mealId,
    required this.ref,
    required this.mealDetail,
  });

  final String mealId;
  final WidgetRef ref;
  final MealDetail mealDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                imageUrl: mealDetail.imageUrl,
                height: 250,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CupertinoActivityIndicator()),
                errorWidget: (context, url, error) =>
                    const Icon(CupertinoIcons.photo, size: 100),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mealDetail.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? AppTheme.darkCardBackground
                                : AppTheme.lightCardBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            mealDetail.category,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? AppTheme.darkCardBackground
                                : AppTheme.lightCardBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            mealDetail.area,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...mealDetail.ingredients.map(
                      (ingredient) =>
                          ingredient.name.isNotEmpty &&
                              ingredient.measure.isNotEmpty
                          ? MealIngredientItem(ingredient: ingredient)
                          : const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Instructions',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      mealDetail.instructions,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/helper/extensions.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/theme_providers.dart';
import '../../domain/entities/category.dart';

class CategoryItem extends ConsumerWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.mealsByCategory, arguments: category.name);
      },
      child: Column(
        spacing: 10,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isDarkMode
                  ? AppTheme.darkCardBackground
                  : AppTheme.lightCardBackground,
            ),
            padding: const EdgeInsets.all(10),
            child: CachedNetworkImage(
              imageUrl: category.imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Text(category.name),
        ],
      ),
    );
  }
}

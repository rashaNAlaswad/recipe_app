import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/helper/extensions.dart';
import '../../../../core/router/routes.dart';
import '../../domain/entities/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});
  @override
  Widget build(BuildContext context) {
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
              color: CupertinoColors.tertiarySystemFill,
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

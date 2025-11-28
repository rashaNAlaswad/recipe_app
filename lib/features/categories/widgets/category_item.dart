import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CupertinoColors.tertiarySystemFill,
          ),
          padding: const EdgeInsets.all(10),
          child: CachedNetworkImage(
            imageUrl: 'https://www.themealdb.com/images/category/beef.png',
            height: 100,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        const Text('Category Name'),
      ],
    );
  }
}

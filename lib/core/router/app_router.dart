import 'package:flutter/cupertino.dart';

import '../../features/categories/presentation/screens/categories_screen.dart';
import '../../features/categories/presentation/screens/meals_by_category_screen.dart';
import '../../features/meal_details/presentation/screens/meal_detail_screen.dart';
import '../../features/search/presentation/screens/search_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.categories:
        return CupertinoPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      case Routes.search:
        return CupertinoPageRoute(builder: (context) => const SearchScreen());
      case Routes.mealDetail:
        final mealId = settings.arguments as String;
        return CupertinoPageRoute(
          builder: (context) => MealDetailScreen(mealId: mealId),
        );
      case Routes.mealsByCategory:
        final categoryName = settings.arguments as String;
        return CupertinoPageRoute(
          builder: (context) =>
              MealsByCategoryScreen(categoryName: categoryName),
        );
    }
    return null;
  }
}

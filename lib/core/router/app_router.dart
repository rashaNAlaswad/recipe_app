import 'package:flutter/cupertino.dart';
import '../../features/categories/screens/categories_screen.dart';
import '../../features/search/screens/search_screen.dart';
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
    }
    return null;
  }
}

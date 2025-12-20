import 'package:flutter/cupertino.dart';

import 'core/router/app_router.dart';
import 'features/home/screens/home_screen.dart';

class RecipeApp extends StatelessWidget {
  final AppRouter appRouter;
  const RecipeApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}

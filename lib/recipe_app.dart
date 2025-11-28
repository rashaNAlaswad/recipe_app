import 'package:flutter/cupertino.dart';

import 'features/home/screens/home_screen.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Recipe App',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'recipe_app.dart';

void main() {
  runApp(ProviderScope(child: RecipeApp(appRouter: AppRouter())));
}

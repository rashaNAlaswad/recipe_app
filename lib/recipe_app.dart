import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_providers.dart';
import 'core/widgets/loading.dart';
import 'features/home/screens/home_screen.dart';

class RecipeApp extends ConsumerWidget {
  final AppRouter appRouter;
  const RecipeApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeAsync = ref.watch(themeModeProvider);

    return themeModeAsync.when(
      data: (themeMode) => CupertinoApp(
        title: 'Recipe App',
        debugShowCheckedModeBanner: false,
        theme: themeMode == Brightness.dark
            ? AppTheme.darkTheme
            : AppTheme.lightTheme,
        home: const HomeScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
      error: (Object error, StackTrace stackTrace) {
        return CupertinoApp(
          home: Center(child: Text('Error loading theme: $error')),
        );
      },
      loading: () {
        return const LoadingWidget();
      },
    );
  }
}

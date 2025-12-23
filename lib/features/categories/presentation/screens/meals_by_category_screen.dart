import 'package:flutter/cupertino.dart' hide ErrorWidget;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/error.dart';
import '../../../../core/widgets/loading.dart';
import '../../../search/presentation/widgets/meal_card.dart';
import '../providers/category_providers.dart';

class MealsByCategoryScreen extends ConsumerWidget {
  final String categoryName;

  const MealsByCategoryScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealsAsync = ref.watch(mealsByCategoryProvider(categoryName));

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(categoryName)),
      child: SafeArea(
        child: mealsAsync.when(
          skipLoadingOnRefresh: false,
          data: (meals) {
            if (meals.isEmpty) return const _EmptyState();

            return CustomScrollView(
              slivers: [
                CupertinoSliverRefreshControl(
                  onRefresh: () async {
                    ref.invalidate(mealsByCategoryProvider(categoryName));
                  },
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return MealCard(meal: meals[index]);
                  }, childCount: meals.length),
                ),
              ],
            );
          },
          error: (error, stack) => ErrorWidget(
            error: error,
            ref: ref,
            onRetry: () {
              ref.invalidate(mealsByCategoryProvider(categoryName));
            },
          ),
          loading: () => const LoadingWidget(),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No meals found'));
  }
}

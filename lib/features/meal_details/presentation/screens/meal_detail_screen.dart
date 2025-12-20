import 'package:flutter/cupertino.dart' hide ErrorWidget;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/error.dart';
import '../../../../core/widgets/loading.dart';
import '../providers/meal_providers.dart';
import '../widgets/meal_detail_screen_content.dart';

class MealDetailScreen extends ConsumerWidget {
  final String mealId;

  const MealDetailScreen({super.key, required this.mealId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealDetailAsync = ref.watch(mealDetailProvider(mealId));

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Meal Details')),
      child: SafeArea(
        child: mealDetailAsync.when(
          data: (mealDetail) {
            return MealDetailScreenContent(
              mealId: mealId,
              ref: ref,
              mealDetail: mealDetail,
            );
          },
          error: (error, stack) => ErrorWidget(
            error: error,
            ref: ref,
            onRetry: () {
              ref.read(mealDetailProvider(mealId).notifier).refresh();
            },
          ),
          loading: () => const LoadingWidget(),
        ),
      ),
    );
  }
}

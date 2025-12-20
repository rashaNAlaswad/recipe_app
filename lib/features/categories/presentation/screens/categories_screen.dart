import 'package:flutter/cupertino.dart' hide ErrorWidget;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/error.dart';
import '../../../../core/widgets/loading.dart';
import '../../domain/entities/category.dart';
import '../providers/category_providers.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Categories')),
      child: SafeArea(
        child: categoriesAsync.when(
          data: (categories) {
            if (categories.isEmpty) {
              return const _EmptyState();
            }
            return _CategoriesListWidget(ref: ref, categories: categories);
          },
          error: (error, stack) => ErrorWidget(
            error: error,
            ref: ref,
            onRetry: () {
              ref.read(categoriesProvider.notifier).refresh();
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
    return Center(child: Text('No categories found'));
  }
}

class _CategoriesListWidget extends StatelessWidget {
  const _CategoriesListWidget({required this.ref, required this.categories});

  final WidgetRef ref;
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            await ref.read(categoriesProvider.notifier).refresh();
          },
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              mainAxisSpacing: 6.0,
              crossAxisSpacing: 16.0,
            ),
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryItem(category: category);
            },
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}

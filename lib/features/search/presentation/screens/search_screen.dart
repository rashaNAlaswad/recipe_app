import 'package:flutter/cupertino.dart' hide ErrorWidget;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/error.dart';
import '../../../../core/widgets/loading.dart';
import '../providers/search_providers.dart';
import '../widgets/meal_card.dart';
import '../widgets/search_bar.dart';

class SearchScreen extends ConsumerStatefulWidget {
  final String? initialQuery;

  const SearchScreen({super.key, this.initialQuery});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final searchAsync = ref.watch(searchProvider);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Search Meals')),
      child: SafeArea(
        child: Column(
          children: [
            SearchBar(
              controller: _searchController,
              onChanged: (query) {
                ref.read(searchProvider.notifier).search(query);
              },
              onClear: () {
                _searchController.clear();
                ref.read(searchProvider.notifier).search('');
              },
            ),
            Expanded(
              child: searchAsync.when(
                data: (meals) => ListView.builder(
                  itemCount: meals.length,
                  itemBuilder: (context, index) => MealCard(meal: meals[index]),
                ),
                error: (error, stack) => ErrorWidget(
                  error: error,
                  ref: ref,
                  onRetry: () {
                    ref.read(searchProvider.notifier).search('');
                  },
                ),
                loading: () => LoadingWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

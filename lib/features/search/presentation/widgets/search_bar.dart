import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/theme_providers.dart';

class SearchBar extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const SearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  ConsumerState<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isDarkMode
            ? AppTheme.darkCardBackground
            : CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: widget.controller,
        builder: (context, value, child) {
          return CupertinoTextField(
            controller: widget.controller,
            placeholder: 'Search meals...',
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(),
            prefix: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(CupertinoIcons.search, size: 20),
            ),
            suffix: value.text.isNotEmpty
                ? CupertinoButton(
                    onPressed: widget.onClear,
                    child: const Icon(
                      CupertinoIcons.clear_circled_solid,
                      size: 20,
                    ),
                  )
                : null,
            onChanged: widget.onChanged,
          );
        },
      ),
    );
  }
}

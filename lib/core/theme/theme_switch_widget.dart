import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme_providers.dart';

class ThemeSwitchWidget extends ConsumerWidget {
  const ThemeSwitchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeAsync = ref.watch(themeModeProvider);

    return themeAsync.when(
      data: (brightness) {
        final isDark = brightness == Brightness.dark;
        return CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            ref.read(themeModeProvider.notifier).toggleTheme();
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            switchInCurve: Curves.easeInOutCubic,
            switchOutCurve: Curves.easeInOutCubic,
            child: Icon(
              isDark ? CupertinoIcons.moon_fill : CupertinoIcons.sun_max_fill,
              key: ValueKey<bool>(isDark),
              size: 24,
            ),
          ),
        );
      },
      loading: () => const CupertinoActivityIndicator(),
      error: (error, stack) =>
          const Icon(CupertinoIcons.exclamationmark_circle),
    );
  }
}

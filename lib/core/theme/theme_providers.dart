import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../storage/cache_helper.dart';
import '../storage/cache_constants.dart';

part 'theme_providers.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  Future<Brightness> build() async {
    final isDark = CacheHelper.getBool(key: AppConstants.themeKey) ?? false;
    return isDark ? Brightness.dark : Brightness.light;
  }

  Future<void> toggleTheme() async {
    final current = await future;
    final newBrightness = current == Brightness.dark
        ? Brightness.light
        : Brightness.dark;

    await CacheHelper.set(
      key: AppConstants.themeKey,
      value: newBrightness == Brightness.dark,
    );

    state = AsyncValue.data(newBrightness);
  }
}

@riverpod
bool isDarkMode(Ref ref) {
  final themeMode = ref.watch(themeModeProvider);
  return themeMode.maybeWhen(
    data: (brightness) => brightness == Brightness.dark,
    orElse: () => false,
  );
}

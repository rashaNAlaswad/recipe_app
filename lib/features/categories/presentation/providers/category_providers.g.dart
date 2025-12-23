// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CategoriesNotifier)
const categoriesProvider = CategoriesNotifierProvider._();

final class CategoriesNotifierProvider
    extends $AsyncNotifierProvider<CategoriesNotifier, List<Category>> {
  const CategoriesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesNotifierHash();

  @$internal
  @override
  CategoriesNotifier create() => CategoriesNotifier();
}

String _$categoriesNotifierHash() =>
    r'0a46a9e0d7a935d6452abec74ed11c11149919e1';

abstract class _$CategoriesNotifier extends $AsyncNotifier<List<Category>> {
  FutureOr<List<Category>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Category>>, List<Category>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Category>>, List<Category>>,
              AsyncValue<List<Category>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(MealsByCategoryNotifier)
const mealsByCategoryProvider = MealsByCategoryNotifierFamily._();

final class MealsByCategoryNotifierProvider
    extends $AsyncNotifierProvider<MealsByCategoryNotifier, List<Meal>> {
  const MealsByCategoryNotifierProvider._({
    required MealsByCategoryNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'mealsByCategoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mealsByCategoryNotifierHash();

  @override
  String toString() {
    return r'mealsByCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MealsByCategoryNotifier create() => MealsByCategoryNotifier();

  @override
  bool operator ==(Object other) {
    return other is MealsByCategoryNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mealsByCategoryNotifierHash() =>
    r'47690027327a5bb23215e101b5e7b2a0b3eefc7f';

final class MealsByCategoryNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MealsByCategoryNotifier,
          AsyncValue<List<Meal>>,
          List<Meal>,
          FutureOr<List<Meal>>,
          String
        > {
  const MealsByCategoryNotifierFamily._()
    : super(
        retry: null,
        name: r'mealsByCategoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MealsByCategoryNotifierProvider call(String category) =>
      MealsByCategoryNotifierProvider._(argument: category, from: this);

  @override
  String toString() => r'mealsByCategoryProvider';
}

abstract class _$MealsByCategoryNotifier extends $AsyncNotifier<List<Meal>> {
  late final _$args = ref.$arg as String;
  String get category => _$args;

  FutureOr<List<Meal>> build(String category);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<List<Meal>>, List<Meal>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Meal>>, List<Meal>>,
              AsyncValue<List<Meal>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

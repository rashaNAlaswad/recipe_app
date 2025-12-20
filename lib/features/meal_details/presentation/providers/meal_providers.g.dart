// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MealDetailNotifier)
const mealDetailProvider = MealDetailNotifierFamily._();

final class MealDetailNotifierProvider
    extends $AsyncNotifierProvider<MealDetailNotifier, MealDetail> {
  const MealDetailNotifierProvider._({
    required MealDetailNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'mealDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mealDetailNotifierHash();

  @override
  String toString() {
    return r'mealDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MealDetailNotifier create() => MealDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is MealDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mealDetailNotifierHash() =>
    r'16671220549e9fef6bd50536e03f7bcbd8d44961';

final class MealDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MealDetailNotifier,
          AsyncValue<MealDetail>,
          MealDetail,
          FutureOr<MealDetail>,
          String
        > {
  const MealDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'mealDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MealDetailNotifierProvider call(String mealId) =>
      MealDetailNotifierProvider._(argument: mealId, from: this);

  @override
  String toString() => r'mealDetailProvider';
}

abstract class _$MealDetailNotifier extends $AsyncNotifier<MealDetail> {
  late final _$args = ref.$arg as String;
  String get mealId => _$args;

  FutureOr<MealDetail> build(String mealId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<MealDetail>, MealDetail>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MealDetail>, MealDetail>,
              AsyncValue<MealDetail>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

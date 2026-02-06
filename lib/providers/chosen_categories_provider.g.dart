// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chosen_categories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChosenCategories)
final chosenCategoriesProvider = ChosenCategoriesProvider._();

final class ChosenCategoriesProvider
    extends $NotifierProvider<ChosenCategories, List<(String, String)>> {
  ChosenCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chosenCategoriesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chosenCategoriesHash();

  @$internal
  @override
  ChosenCategories create() => ChosenCategories();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<(String, String)> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<(String, String)>>(value),
    );
  }
}

String _$chosenCategoriesHash() => r'0b2453d60808275f9a5552a73727235d2537b27a';

abstract class _$ChosenCategories extends $Notifier<List<(String, String)>> {
  List<(String, String)> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<List<(String, String)>, List<(String, String)>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<(String, String)>, List<(String, String)>>,
              List<(String, String)>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

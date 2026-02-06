// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_palette_types_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ActivePaletteTypes)
final activePaletteTypesProvider = ActivePaletteTypesProvider._();

final class ActivePaletteTypesProvider
    extends $NotifierProvider<ActivePaletteTypes, List<PaletteType>> {
  ActivePaletteTypesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activePaletteTypesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activePaletteTypesHash();

  @$internal
  @override
  ActivePaletteTypes create() => ActivePaletteTypes();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<PaletteType> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<PaletteType>>(value),
    );
  }
}

String _$activePaletteTypesHash() =>
    r'b9bb6f33857aa56b3148e3af30d977a1d533ad99';

abstract class _$ActivePaletteTypes extends $Notifier<List<PaletteType>> {
  List<PaletteType> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<PaletteType>, List<PaletteType>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<PaletteType>, List<PaletteType>>,
              List<PaletteType>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

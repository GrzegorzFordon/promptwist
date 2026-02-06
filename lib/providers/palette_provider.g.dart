// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palette_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Palette)
final paletteProvider = PaletteProvider._();

final class PaletteProvider extends $NotifierProvider<Palette, List<HSVColor>> {
  PaletteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paletteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paletteHash();

  @$internal
  @override
  Palette create() => Palette();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<HSVColor> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<HSVColor>>(value),
    );
  }
}

String _$paletteHash() => r'7924348360ab563f53262124bb1b342ef7847423';

abstract class _$Palette extends $Notifier<List<HSVColor>> {
  List<HSVColor> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<HSVColor>, List<HSVColor>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<HSVColor>, List<HSVColor>>,
              List<HSVColor>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

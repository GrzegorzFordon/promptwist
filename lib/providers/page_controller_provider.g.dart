// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pageController)
final pageControllerProvider = PageControllerProvider._();

final class PageControllerProvider
    extends $FunctionalProvider<PageController, PageController, PageController>
    with $Provider<PageController> {
  PageControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pageControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pageControllerHash();

  @$internal
  @override
  $ProviderElement<PageController> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PageController create(Ref ref) {
    return pageController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PageController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PageController>(value),
    );
  }
}

String _$pageControllerHash() => r'c059306b3226f1af8cb629e940a4f0d55740b58e';

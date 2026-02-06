// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(data)
final dataProvider = DataProvider._();

final class DataProvider
    extends
        $FunctionalProvider<
          AsyncValue<DataModel>,
          DataModel,
          FutureOr<DataModel>
        >
    with $FutureModifier<DataModel>, $FutureProvider<DataModel> {
  DataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dataHash();

  @$internal
  @override
  $FutureProviderElement<DataModel> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<DataModel> create(Ref ref) {
    return data(ref);
  }
}

String _$dataHash() => r'4de1de7dd412d7e11ce8150fecf14cfdf3d1497d';

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_storage.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Hive storage provider

@ProviderFor(hiveStorage)
final hiveStorageProvider = HiveStorageProvider._();

/// Hive storage provider

final class HiveStorageProvider
    extends
        $FunctionalProvider<
          AsyncValue<HiveStorage>,
          HiveStorage,
          FutureOr<HiveStorage>
        >
    with $FutureModifier<HiveStorage>, $FutureProvider<HiveStorage> {
  /// Hive storage provider
  HiveStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hiveStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hiveStorageHash();

  @$internal
  @override
  $FutureProviderElement<HiveStorage> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<HiveStorage> create(Ref ref) {
    return hiveStorage(ref);
  }
}

String _$hiveStorageHash() => r'c1d5849af88af5fb20fd845ac1ce3eb8f0571ed9';

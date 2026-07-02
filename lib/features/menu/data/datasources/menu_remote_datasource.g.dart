// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_remote_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Menu remote data source provider

@ProviderFor(menuRemoteDataSource)
final menuRemoteDataSourceProvider = MenuRemoteDataSourceProvider._();

/// Menu remote data source provider

final class MenuRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          MenuRemoteDataSource,
          MenuRemoteDataSource,
          MenuRemoteDataSource
        >
    with $Provider<MenuRemoteDataSource> {
  /// Menu remote data source provider
  MenuRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'menuRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$menuRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<MenuRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MenuRemoteDataSource create(Ref ref) {
    return menuRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MenuRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MenuRemoteDataSource>(value),
    );
  }
}

String _$menuRemoteDataSourceHash() =>
    r'f1c3c48d3c21b21d7dc3f5b0244646b482898be6';

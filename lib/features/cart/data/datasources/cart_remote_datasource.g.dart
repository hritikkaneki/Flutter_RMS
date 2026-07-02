// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_remote_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Cart remote data source provider

@ProviderFor(cartRemoteDataSource)
final cartRemoteDataSourceProvider = CartRemoteDataSourceProvider._();

/// Cart remote data source provider

final class CartRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          CartRemoteDataSource,
          CartRemoteDataSource,
          CartRemoteDataSource
        >
    with $Provider<CartRemoteDataSource> {
  /// Cart remote data source provider
  CartRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<CartRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CartRemoteDataSource create(Ref ref) {
    return cartRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CartRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CartRemoteDataSource>(value),
    );
  }
}

String _$cartRemoteDataSourceHash() =>
    r'c922a3e0f5c51834d717da32180362a42c7f7d70';

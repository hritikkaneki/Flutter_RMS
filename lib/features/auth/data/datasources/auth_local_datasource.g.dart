// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_local_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Auth local data source provider

@ProviderFor(authLocalDataSource)
final authLocalDataSourceProvider = AuthLocalDataSourceProvider._();

/// Auth local data source provider

final class AuthLocalDataSourceProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuthLocalDataSource>,
          AuthLocalDataSource,
          FutureOr<AuthLocalDataSource>
        >
    with
        $FutureModifier<AuthLocalDataSource>,
        $FutureProvider<AuthLocalDataSource> {
  /// Auth local data source provider
  AuthLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authLocalDataSourceHash();

  @$internal
  @override
  $FutureProviderElement<AuthLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AuthLocalDataSource> create(Ref ref) {
    return authLocalDataSource(ref);
  }
}

String _$authLocalDataSourceHash() =>
    r'a12be71ffe4526e704f7dc182642045dca475a1f';

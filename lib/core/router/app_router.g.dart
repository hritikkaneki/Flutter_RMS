// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// GoRouter configuration provider
///
/// Routes are driven reactively by auth state:
/// - Unauthenticated → [SplashScreen] → [LoginScreen]
/// - Authenticated → [HomeScreen]
///
/// Route guards are enforced via [redirect] callback watching [authProvider]

@ProviderFor(goRouter)
final goRouterProvider = GoRouterProvider._();

/// GoRouter configuration provider
///
/// Routes are driven reactively by auth state:
/// - Unauthenticated → [SplashScreen] → [LoginScreen]
/// - Authenticated → [HomeScreen]
///
/// Route guards are enforced via [redirect] callback watching [authProvider]

final class GoRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// GoRouter configuration provider
  ///
  /// Routes are driven reactively by auth state:
  /// - Unauthenticated → [SplashScreen] → [LoginScreen]
  /// - Authenticated → [HomeScreen]
  ///
  /// Route guards are enforced via [redirect] callback watching [authProvider]
  GoRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'goRouterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$goRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return goRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$goRouterHash() => r'25728d0396af9c861c9b312203b38299b84a95e3';

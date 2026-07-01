// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Auth state notifier provider

@ProviderFor(AuthNotifier)
final authProvider = AuthNotifierProvider._();

/// Auth state notifier provider
final class AuthNotifierProvider
    extends $AsyncNotifierProvider<AuthNotifier, UserEntity?> {
  /// Auth state notifier provider
  AuthNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authNotifierHash();

  @$internal
  @override
  AuthNotifier create() => AuthNotifier();
}

String _$authNotifierHash() => r'3996cb5e3e299b78bf998351d51e0b7e580f4e88';

/// Auth state notifier provider

abstract class _$AuthNotifier extends $AsyncNotifier<UserEntity?> {
  FutureOr<UserEntity?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserEntity?>, UserEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserEntity?>, UserEntity?>,
              AsyncValue<UserEntity?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Helper provider to check if user is authenticated

@ProviderFor(isAuthenticated)
final isAuthenticatedProvider = IsAuthenticatedProvider._();

/// Helper provider to check if user is authenticated

final class IsAuthenticatedProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Helper provider to check if user is authenticated
  IsAuthenticatedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isAuthenticatedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isAuthenticatedHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isAuthenticated(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAuthenticatedHash() => r'dc783f052ad2ddb7fa18c58e5dc6d212e6c32a96';

/// Helper provider to get current user

@ProviderFor(currentUser)
final currentUserProvider = CurrentUserProvider._();

/// Helper provider to get current user

final class CurrentUserProvider
    extends $FunctionalProvider<UserEntity?, UserEntity?, UserEntity?>
    with $Provider<UserEntity?> {
  /// Helper provider to get current user
  CurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserHash();

  @$internal
  @override
  $ProviderElement<UserEntity?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserEntity? create(Ref ref) {
    return currentUser(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserEntity?>(value),
    );
  }
}

String _$currentUserHash() => r'547feb0259e5bcf6a7e527c698a35a770358db9f';

/// Helper provider to get current user role

@ProviderFor(currentUserRole)
final currentUserRoleProvider = CurrentUserRoleProvider._();

/// Helper provider to get current user role

final class CurrentUserRoleProvider
    extends $FunctionalProvider<UserRole?, UserRole?, UserRole?>
    with $Provider<UserRole?> {
  /// Helper provider to get current user role
  CurrentUserRoleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserRoleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserRoleHash();

  @$internal
  @override
  $ProviderElement<UserRole?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRole? create(Ref ref) {
    return currentUserRole(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRole? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRole?>(value),
    );
  }
}

String _$currentUserRoleHash() => r'0ba8751ae4a08f798ae64b0bfbb2cc9a2ef1b032';

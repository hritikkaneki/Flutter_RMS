// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Menu repository provider handles the asynchronous storage extraction smoothly

@ProviderFor(menuRepository)
final menuRepositoryProvider = MenuRepositoryProvider._();

/// Menu repository provider handles the asynchronous storage extraction smoothly

final class MenuRepositoryProvider
    extends $FunctionalProvider<MenuRepository, MenuRepository, MenuRepository>
    with $Provider<MenuRepository> {
  /// Menu repository provider handles the asynchronous storage extraction smoothly
  MenuRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'menuRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$menuRepositoryHash();

  @$internal
  @override
  $ProviderElement<MenuRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MenuRepository create(Ref ref) {
    return menuRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MenuRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MenuRepository>(value),
    );
  }
}

String _$menuRepositoryHash() => r'35f3191898d85a76e253043ec2bbb2056ac54251';

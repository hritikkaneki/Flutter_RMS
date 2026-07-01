// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cached_user_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Get cached user use case provider

@ProviderFor(getCachedUserUseCase)
final getCachedUserUseCaseProvider = GetCachedUserUseCaseProvider._();

/// Get cached user use case provider

final class GetCachedUserUseCaseProvider
    extends
        $FunctionalProvider<
          GetCachedUserUseCase,
          GetCachedUserUseCase,
          GetCachedUserUseCase
        >
    with $Provider<GetCachedUserUseCase> {
  /// Get cached user use case provider
  GetCachedUserUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCachedUserUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCachedUserUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetCachedUserUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCachedUserUseCase create(Ref ref) {
    return getCachedUserUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCachedUserUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCachedUserUseCase>(value),
    );
  }
}

String _$getCachedUserUseCaseHash() =>
    r'e493bb9c4579b27620fbfa950ec18ce71766e311';

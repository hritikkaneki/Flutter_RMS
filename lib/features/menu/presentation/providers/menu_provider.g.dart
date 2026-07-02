// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Complete menu data provider

@ProviderFor(menu)
final menuProvider = MenuProvider._();

/// Complete menu data provider

final class MenuProvider
    extends $FunctionalProvider<AsyncValue<Menu>, Menu, FutureOr<Menu>>
    with $FutureModifier<Menu>, $FutureProvider<Menu> {
  /// Complete menu data provider
  MenuProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'menuProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$menuHash();

  @$internal
  @override
  $FutureProviderElement<Menu> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Menu> create(Ref ref) {
    return menu(ref);
  }
}

String _$menuHash() => r'13dd805fbafef67a21b28f03079f00638d9b93f9';

/// Menu items by category provider

@ProviderFor(menuItemsByCategory)
final menuItemsByCategoryProvider = MenuItemsByCategoryFamily._();

/// Menu items by category provider

final class MenuItemsByCategoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MenuItem>>,
          List<MenuItem>,
          FutureOr<List<MenuItem>>
        >
    with $FutureModifier<List<MenuItem>>, $FutureProvider<List<MenuItem>> {
  /// Menu items by category provider
  MenuItemsByCategoryProvider._({
    required MenuItemsByCategoryFamily super.from,
    required MenuCategory super.argument,
  }) : super(
         retry: null,
         name: r'menuItemsByCategoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$menuItemsByCategoryHash();

  @override
  String toString() {
    return r'menuItemsByCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<MenuItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MenuItem>> create(Ref ref) {
    final argument = this.argument as MenuCategory;
    return menuItemsByCategory(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MenuItemsByCategoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$menuItemsByCategoryHash() =>
    r'c6c81677e24135882a12c0daea2cd757b6cb18a2';

/// Menu items by category provider

final class MenuItemsByCategoryFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<MenuItem>>, MenuCategory> {
  MenuItemsByCategoryFamily._()
    : super(
        retry: null,
        name: r'menuItemsByCategoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Menu items by category provider

  MenuItemsByCategoryProvider call(MenuCategory category) =>
      MenuItemsByCategoryProvider._(argument: category, from: this);

  @override
  String toString() => r'menuItemsByCategoryProvider';
}

/// Vegetarian items provider

@ProviderFor(vegetarianMenuItems)
final vegetarianMenuItemsProvider = VegetarianMenuItemsProvider._();

/// Vegetarian items provider

final class VegetarianMenuItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MenuItem>>,
          List<MenuItem>,
          FutureOr<List<MenuItem>>
        >
    with $FutureModifier<List<MenuItem>>, $FutureProvider<List<MenuItem>> {
  /// Vegetarian items provider
  VegetarianMenuItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vegetarianMenuItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vegetarianMenuItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<MenuItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MenuItem>> create(Ref ref) {
    return vegetarianMenuItems(ref);
  }
}

String _$vegetarianMenuItemsHash() =>
    r'3f0843b92ed102b97be5c6cad11dd347e187b59c';

/// Search menu items provider with query parameter

@ProviderFor(searchMenuItems)
final searchMenuItemsProvider = SearchMenuItemsFamily._();

/// Search menu items provider with query parameter

final class SearchMenuItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MenuItem>>,
          List<MenuItem>,
          FutureOr<List<MenuItem>>
        >
    with $FutureModifier<List<MenuItem>>, $FutureProvider<List<MenuItem>> {
  /// Search menu items provider with query parameter
  SearchMenuItemsProvider._({
    required SearchMenuItemsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'searchMenuItemsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchMenuItemsHash();

  @override
  String toString() {
    return r'searchMenuItemsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<MenuItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MenuItem>> create(Ref ref) {
    final argument = this.argument as String;
    return searchMenuItems(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchMenuItemsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchMenuItemsHash() => r'7059f83eecc84349c35048f153a728472e0a348a';

/// Search menu items provider with query parameter

final class SearchMenuItemsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<MenuItem>>, String> {
  SearchMenuItemsFamily._()
    : super(
        retry: null,
        name: r'searchMenuItemsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Search menu items provider with query parameter

  SearchMenuItemsProvider call(String query) =>
      SearchMenuItemsProvider._(argument: query, from: this);

  @override
  String toString() => r'searchMenuItemsProvider';
}

/// Selected menu category filter

@ProviderFor(SelectedMenuCategory)
final selectedMenuCategoryProvider = SelectedMenuCategoryProvider._();

/// Selected menu category filter
final class SelectedMenuCategoryProvider
    extends $NotifierProvider<SelectedMenuCategory, MenuCategory?> {
  /// Selected menu category filter
  SelectedMenuCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedMenuCategoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedMenuCategoryHash();

  @$internal
  @override
  SelectedMenuCategory create() => SelectedMenuCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MenuCategory? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MenuCategory?>(value),
    );
  }
}

String _$selectedMenuCategoryHash() =>
    r'3ce945f11b6dcde3103ad96a0318fdbf69ba96bc';

/// Selected menu category filter

abstract class _$SelectedMenuCategory extends $Notifier<MenuCategory?> {
  MenuCategory? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MenuCategory?, MenuCategory?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MenuCategory?, MenuCategory?>,
              MenuCategory?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Menu search query state

@ProviderFor(MenuSearchQuery)
final menuSearchQueryProvider = MenuSearchQueryProvider._();

/// Menu search query state
final class MenuSearchQueryProvider
    extends $NotifierProvider<MenuSearchQuery, String> {
  /// Menu search query state
  MenuSearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'menuSearchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$menuSearchQueryHash();

  @$internal
  @override
  MenuSearchQuery create() => MenuSearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$menuSearchQueryHash() => r'e8b89978780d57e2e85449196bd4cb4a56ea46e9';

/// Menu search query state

abstract class _$MenuSearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Filtered menu items provider
/// Combines search query + category filter

@ProviderFor(filteredMenuItems)
final filteredMenuItemsProvider = FilteredMenuItemsProvider._();

/// Filtered menu items provider
/// Combines search query + category filter

final class FilteredMenuItemsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MenuItem>>,
          List<MenuItem>,
          FutureOr<List<MenuItem>>
        >
    with $FutureModifier<List<MenuItem>>, $FutureProvider<List<MenuItem>> {
  /// Filtered menu items provider
  /// Combines search query + category filter
  FilteredMenuItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredMenuItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredMenuItemsHash();

  @$internal
  @override
  $FutureProviderElement<List<MenuItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MenuItem>> create(Ref ref) {
    return filteredMenuItems(ref);
  }
}

String _$filteredMenuItemsHash() => r'1985e36c1594a0b6f8e481df75cbd90595dab251';

/// Favorites/saved items provider (local storage)

@ProviderFor(FavoriteMenuItems)
final favoriteMenuItemsProvider = FavoriteMenuItemsProvider._();

/// Favorites/saved items provider (local storage)
final class FavoriteMenuItemsProvider
    extends $NotifierProvider<FavoriteMenuItems, Set<String>> {
  /// Favorites/saved items provider (local storage)
  FavoriteMenuItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteMenuItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteMenuItemsHash();

  @$internal
  @override
  FavoriteMenuItems create() => FavoriteMenuItems();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$favoriteMenuItemsHash() => r'7dca9ca3368232befabdf0f9ad84f7ce4092235d';

/// Favorites/saved items provider (local storage)

abstract class _$FavoriteMenuItems extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Menu view mode provider

@ProviderFor(MenuViewModeNotifier)
final menuViewModeProvider = MenuViewModeNotifierProvider._();

/// Menu view mode provider
final class MenuViewModeNotifierProvider
    extends $NotifierProvider<MenuViewModeNotifier, MenuViewMode> {
  /// Menu view mode provider
  MenuViewModeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'menuViewModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$menuViewModeNotifierHash();

  @$internal
  @override
  MenuViewModeNotifier create() => MenuViewModeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MenuViewMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MenuViewMode>(value),
    );
  }
}

String _$menuViewModeNotifierHash() =>
    r'eb751900a68a762f41ce428c49b3a2a398c5528a';

/// Menu view mode provider

abstract class _$MenuViewModeNotifier extends $Notifier<MenuViewMode> {
  MenuViewMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MenuViewMode, MenuViewMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MenuViewMode, MenuViewMode>,
              MenuViewMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

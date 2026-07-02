import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_management_system/core/error/failures.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/menu_entity.dart';
import '../../domain/usecases/menu_usecases.dart';

part 'menu_provider.g.dart';

// ══════════════════════════════════════════════════════════════════════════
// Menu State Providers
// ══════════════════════════════════════════════════════════════════════════

/// Complete menu data provider
@riverpod
Future<Menu> menu(Ref ref) async {
  final result = await ref.watch(getMenuUseCaseProvider).call();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (menu) => menu,
  );
}

/// Menu items by category provider
@riverpod
Future<List<MenuItem>> menuItemsByCategory(
  Ref ref,
  MenuCategory category,
) async {
  final result =
      await ref.watch(getItemsByCategoryUseCaseProvider).call(category);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (items) => items,
  );
}

/// Vegetarian items provider
@riverpod
Future<List<MenuItem>> vegetarianMenuItems(Ref ref) async {
  final result =
      await ref.watch(getVegetarianItemsUseCaseProvider).call();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (items) => items,
  );
}

/// Search menu items provider with query parameter
@riverpod
Future<List<MenuItem>> searchMenuItems(
  Ref ref,
  String query,
) async {
  if (query.isEmpty) {
    return [];
  }
  final result = await ref.watch(searchMenuItemsUseCaseProvider).call(query);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (items) => items,
  );
}

// ══════════════════════════════════════════════════════════════════════════
// UI State Providers
// ══════════════════════════════════════════════════════════════════════════

/// Selected menu category filter
@riverpod
class SelectedMenuCategory extends _$SelectedMenuCategory {
  @override
  MenuCategory? build() => null;

  void select(MenuCategory? category) => state = category;
}

/// Menu search query state
@riverpod
class MenuSearchQuery extends _$MenuSearchQuery {
  @override
  String build() => '';

  void updateQuery(String query) => state = query;

  void clear() => state = '';
}

/// Filtered menu items provider
/// Combines search query + category filter
@riverpod
Future<List<MenuItem>> filteredMenuItems(Ref ref) async {
  final searchQuery = ref.watch(menuSearchQueryProvider);
  final selectedCategory = ref.watch(selectedMenuCategoryProvider);

  try {
    if (searchQuery.isNotEmpty) {
      // If search query exists, use search
      return await ref.watch(searchMenuItemsProvider(searchQuery).future);
    } else if (selectedCategory != null) {
      // If category selected, filter by category
      return await ref.watch(
        menuItemsByCategoryProvider(selectedCategory).future,
      );
    } else {
      // Get all items from complete menu
      final menu = await ref.watch(menuProvider.future);
      return menu.availableItems;
    }
  } catch (e) {
    return [];
  }
}

/// Favorites/saved items provider (local storage)
@riverpod
class FavoriteMenuItems extends _$FavoriteMenuItems {
  @override
  Set<String> build() => {};

  void toggleFavorite(String itemId) {
    state = {...state};
    if (state.contains(itemId)) {
      state.remove(itemId);
    } else {
      state.add(itemId);
    }
    // TODO: Persist to secure storage in Phase 4c
  }

  bool isFavorite(String itemId) => state.contains(itemId);
}

/// View mode for menu display
enum MenuViewMode { grid, list }

/// Menu view mode provider
@riverpod
class MenuViewModeNotifier extends _$MenuViewModeNotifier {
  @override
  MenuViewMode build() => MenuViewMode.grid;

  void toggleViewMode() {
    // 'state' is now fully recognized by the compiler!
    state = state == MenuViewMode.grid ? MenuViewMode.list : MenuViewMode.grid;
  }
}

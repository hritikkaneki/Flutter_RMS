import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_entity.freezed.dart';
part 'menu_entity.g.dart';

/// Menu category enum
enum MenuCategory {
  @JsonValue('APPETIZERS')
  appetizers,
  @JsonValue('MAIN_COURSE')
  mainCourse,
  @JsonValue('DESSERTS')
  desserts,
  @JsonValue('BEVERAGES')
  beverages,
  @JsonValue('SOUPS')
  soups,
  @JsonValue('SALADS')
  salads,
}

/// Extension for MenuCategory
extension MenuCategoryX on MenuCategory {
  String get displayName {
    switch (this) {
      case MenuCategory.appetizers:
        return 'Appetizers';
      case MenuCategory.mainCourse:
        return 'Main Course';
      case MenuCategory.desserts:
        return 'Desserts';
      case MenuCategory.beverages:
        return 'Beverages';
      case MenuCategory.soups:
        return 'Soups';
      case MenuCategory.salads:
        return 'Salads';
    }
  }

  String get icon {
    switch (this) {
      case MenuCategory.appetizers:
        return '🍤';
      case MenuCategory.mainCourse:
        return '🍽️';
      case MenuCategory.desserts:
        return '🍰';
      case MenuCategory.beverages:
        return '🥤';
      case MenuCategory.soups:
        return '🍲';
      case MenuCategory.salads:
        return '🥗';
    }
  }
}

/// Menu item entity - domain model
@freezed
abstract class MenuItem with _$MenuItem {
  const MenuItem._();

  const factory MenuItem({
    required String id,
    required String name,
    required String description,
    required MenuCategory category,
    required double price,
    required bool available,
    String? imageUrl,
    String? notes,
    int? preparationTime, // in minutes
    List<String>? allergens,
    bool? isVegetarian,
    bool? isSpicy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MenuItem;

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);

  /// Get display price with currency
  String get displayPrice => '\$${price.toStringAsFixed(2)}';

  /// Get preparation time display
  String get preparationDisplay {
    if (preparationTime == null) return 'N/A';
    if (preparationTime! < 60) return '${preparationTime} min';
    final hours = preparationTime! ~/ 60;
    final mins = preparationTime! % 60;
    return '${hours}h ${mins}m';
  }
}

/// Menu section entity - groups items by category
@freezed
abstract class MenuSection with _$MenuSection {
  const MenuSection._();

  const factory MenuSection({
    required MenuCategory category,
    required List<MenuItem> items,
  }) = _MenuSection;

  factory MenuSection.fromJson(Map<String, dynamic> json) =>
      _$MenuSectionFromJson(json);

  /// Get section display name
  String get displayName => category.displayName;

  /// Get section icon
  String get displayIcon => category.icon;

  /// Get count of available items
  int get availableCount => items.where((item) => item.available).length;
}

/// Complete menu entity
@freezed
abstract class Menu with _$Menu {
  const Menu._();

  const factory Menu({
    required String id,
    required String restaurantId,
    required List<MenuSection> sections,
    required DateTime lastUpdated,
    String? version,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  /// Get all items from all sections
  List<MenuItem> get allItems =>
      sections.expand((section) => section.items).toList();

  /// Get available items only
  List<MenuItem> get availableItems =>
      allItems.where((item) => item.available).toList();

  /// Search items by name or description
  List<MenuItem> searchItems(String query) {
    final lowerQuery = query.toLowerCase();
    return availableItems
        .where((item) =>
            item.name.toLowerCase().contains(lowerQuery) ||
            item.description.toLowerCase().contains(lowerQuery))
        .toList();
  }

  /// Get items by category
  List<MenuItem> getItemsByCategory(MenuCategory category) {
    return availableItems
        .where((item) => item.category == category)
        .toList();
  }

  /// Get vegetarian items
  List<MenuItem> getVegetarianItems() {
    return availableItems.where((item) => item.isVegetarian == true).toList();
  }

  /// Get items without specific allergen
  List<MenuItem> getItemsWithoutAllergen(String allergen) {
    return availableItems
        .where((item) =>
            item.allergens == null || !item.allergens!.contains(allergen))
        .toList();
  }
}

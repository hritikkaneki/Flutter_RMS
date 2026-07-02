import '../../domain/entities/menu_entity.dart';
import '../dtos/menu_dto.dart';

/// Mapper to convert between DTOs and Entities
class MenuMapper {
  MenuMapper._();

  // ══════════════════════════════════════════════════════════════════════════
  // Menu item mapping
  // ══════════════════════════════════════════════════════════════════════════

  /// Map MenuItemDto to MenuItem entity
  static MenuItem menuItemDtoToEntity(MenuItemDto dto) {
    return MenuItem(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      category: _mapCategoryString(dto.category),
      price: dto.price,
      available: dto.available,
      imageUrl: dto.imageUrl,
      notes: dto.notes,
      preparationTime: dto.preparationTime,
      allergens: dto.allergens,
      isVegetarian: dto.isVegetarian,
      isSpicy: dto.isSpicy,
      createdAt:
          dto.createdAt != null ? DateTime.tryParse(dto.createdAt!) : null,
      updatedAt:
          dto.updatedAt != null ? DateTime.tryParse(dto.updatedAt!) : null,
    );
  }

  /// Map MenuItem entity to MenuItemDto
  static MenuItemDto menuItemEntityToDto(MenuItem entity) {
    return MenuItemDto(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      category: _mapCategoryToString(entity.category),
      price: entity.price,
      available: entity.available,
      imageUrl: entity.imageUrl,
      notes: entity.notes,
      preparationTime: entity.preparationTime,
      allergens: entity.allergens,
      isVegetarian: entity.isVegetarian,
      isSpicy: entity.isSpicy,
      createdAt: entity.createdAt?.toIso8601String(),
      updatedAt: entity.updatedAt?.toIso8601String(),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Menu section mapping
  // ══════════════════════════════════════════════════════════════════════════

  /// Map MenuSectionDto to MenuSection entity
  static MenuSection menuSectionDtoToEntity(MenuSectionDto dto) {
    return MenuSection(
      category: _mapCategoryString(dto.category),
      items: dto.items.map(menuItemDtoToEntity).toList(),
    );
  }

  /// Map MenuSection entity to MenuSectionDto
  static MenuSectionDto menuSectionEntityToDto(MenuSection entity) {
    return MenuSectionDto(
      category: _mapCategoryToString(entity.category),
      items: entity.items.map(menuItemEntityToDto).toList(),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Menu mapping
  // ══════════════════════════════════════════════════════════════════════════

  /// Map MenuDto to Menu entity
  static Menu menuDtoToEntity(MenuDto dto) {
    return Menu(
      id: dto.id,
      restaurantId: dto.restaurantId,
      sections: dto.sections.map(menuSectionDtoToEntity).toList(),
      lastUpdated: DateTime.tryParse(dto.lastUpdated) ?? DateTime.now(),
      version: dto.version,
    );
  }

  /// Map Menu entity to MenuDto
  static MenuDto menuEntityToDto(Menu entity) {
    return MenuDto(
      id: entity.id,
      restaurantId: entity.restaurantId,
      sections: entity.sections.map(menuSectionEntityToDto).toList(),
      lastUpdated: entity.lastUpdated.toIso8601String(),
      version: entity.version,
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Private helpers
  // ══════════════════════════════════════════════════════════════════════════

  /// Map category string to MenuCategory enum
  static MenuCategory _mapCategoryString(String category) {
    switch (category.toUpperCase()) {
      case 'APPETIZERS':
        return MenuCategory.appetizers;
      case 'MAIN_COURSE':
        return MenuCategory.mainCourse;
      case 'DESSERTS':
        return MenuCategory.desserts;
      case 'BEVERAGES':
        return MenuCategory.beverages;
      case 'SOUPS':
        return MenuCategory.soups;
      case 'SALADS':
        return MenuCategory.salads;
      default:
        throw ArgumentError('Unknown category: $category');
    }
  }

  /// Map MenuCategory enum to string
  static String _mapCategoryToString(MenuCategory category) {
    switch (category) {
      case MenuCategory.appetizers:
        return 'APPETIZERS';
      case MenuCategory.mainCourse:
        return 'MAIN_COURSE';
      case MenuCategory.desserts:
        return 'DESSERTS';
      case MenuCategory.beverages:
        return 'BEVERAGES';
      case MenuCategory.soups:
        return 'SOUPS';
      case MenuCategory.salads:
        return 'SALADS';
    }
  }
}

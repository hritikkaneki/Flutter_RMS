import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_dto.freezed.dart';
part 'menu_dto.g.dart';

/// Menu item DTO for API communication
@freezed
abstract class MenuItemDto with _$MenuItemDto {
  const MenuItemDto._();

  const factory MenuItemDto({
    required String id,
    required String name,
    required String description,
    required String category,
    required double price,
    required bool available,
    String? imageUrl,
    String? notes,
    int? preparationTime,
    List<String>? allergens,
    bool? isVegetarian,
    bool? isSpicy,
    String? createdAt,
    String? updatedAt,
  }) = _MenuItemDto;

  factory MenuItemDto.fromJson(Map<String, dynamic> json) =>
      _$MenuItemDtoFromJson(json);
}

/// Menu section DTO
@freezed
abstract class MenuSectionDto with _$MenuSectionDto {
  const MenuSectionDto._();

  const factory MenuSectionDto({
    required String category,
    required List<MenuItemDto> items,
  }) = _MenuSectionDto;

  factory MenuSectionDto.fromJson(Map<String, dynamic> json) =>
      _$MenuSectionDtoFromJson(json);
}

/// Complete menu DTO
@freezed
abstract class MenuDto with _$MenuDto {
  const MenuDto._();

  const factory MenuDto({
    required String id,
    required String restaurantId,
    required List<MenuSectionDto> sections,
    required String lastUpdated,
    String? version,
  }) = _MenuDto;

  factory MenuDto.fromJson(Map<String, dynamic> json) =>
      _$MenuDtoFromJson(json);
}

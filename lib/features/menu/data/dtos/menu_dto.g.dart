// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuItemDto _$MenuItemDtoFromJson(Map<String, dynamic> json) => _MenuItemDto(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  category: json['category'] as String,
  price: (json['price'] as num).toDouble(),
  available: json['available'] as bool,
  imageUrl: json['imageUrl'] as String?,
  notes: json['notes'] as String?,
  preparationTime: (json['preparationTime'] as num?)?.toInt(),
  allergens: (json['allergens'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  isVegetarian: json['isVegetarian'] as bool?,
  isSpicy: json['isSpicy'] as bool?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$MenuItemDtoToJson(_MenuItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'available': instance.available,
      'imageUrl': instance.imageUrl,
      'notes': instance.notes,
      'preparationTime': instance.preparationTime,
      'allergens': instance.allergens,
      'isVegetarian': instance.isVegetarian,
      'isSpicy': instance.isSpicy,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_MenuSectionDto _$MenuSectionDtoFromJson(Map<String, dynamic> json) =>
    _MenuSectionDto(
      category: json['category'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => MenuItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuSectionDtoToJson(_MenuSectionDto instance) =>
    <String, dynamic>{'category': instance.category, 'items': instance.items};

_MenuDto _$MenuDtoFromJson(Map<String, dynamic> json) => _MenuDto(
  id: json['id'] as String,
  restaurantId: json['restaurantId'] as String,
  sections: (json['sections'] as List<dynamic>)
      .map((e) => MenuSectionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastUpdated: json['lastUpdated'] as String,
  version: json['version'] as String?,
);

Map<String, dynamic> _$MenuDtoToJson(_MenuDto instance) => <String, dynamic>{
  'id': instance.id,
  'restaurantId': instance.restaurantId,
  'sections': instance.sections,
  'lastUpdated': instance.lastUpdated,
  'version': instance.version,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuItem _$MenuItemFromJson(Map<String, dynamic> json) => _MenuItem(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  category: $enumDecode(_$MenuCategoryEnumMap, json['category']),
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
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$MenuItemToJson(_MenuItem instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'category': _$MenuCategoryEnumMap[instance.category]!,
  'price': instance.price,
  'available': instance.available,
  'imageUrl': instance.imageUrl,
  'notes': instance.notes,
  'preparationTime': instance.preparationTime,
  'allergens': instance.allergens,
  'isVegetarian': instance.isVegetarian,
  'isSpicy': instance.isSpicy,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

const _$MenuCategoryEnumMap = {
  MenuCategory.appetizers: 'APPETIZERS',
  MenuCategory.mainCourse: 'MAIN_COURSE',
  MenuCategory.desserts: 'DESSERTS',
  MenuCategory.beverages: 'BEVERAGES',
  MenuCategory.soups: 'SOUPS',
  MenuCategory.salads: 'SALADS',
};

_MenuSection _$MenuSectionFromJson(Map<String, dynamic> json) => _MenuSection(
  category: $enumDecode(_$MenuCategoryEnumMap, json['category']),
  items: (json['items'] as List<dynamic>)
      .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MenuSectionToJson(_MenuSection instance) =>
    <String, dynamic>{
      'category': _$MenuCategoryEnumMap[instance.category]!,
      'items': instance.items,
    };

_Menu _$MenuFromJson(Map<String, dynamic> json) => _Menu(
  id: json['id'] as String,
  restaurantId: json['restaurantId'] as String,
  sections: (json['sections'] as List<dynamic>)
      .map((e) => MenuSection.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
  version: json['version'] as String?,
);

Map<String, dynamic> _$MenuToJson(_Menu instance) => <String, dynamic>{
  'id': instance.id,
  'restaurantId': instance.restaurantId,
  'sections': instance.sections,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
  'version': instance.version,
};

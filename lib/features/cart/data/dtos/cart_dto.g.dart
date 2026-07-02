// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItemDto _$CartItemDtoFromJson(Map<String, dynamic> json) => _CartItemDto(
  menuItem: MenuItemDto.fromJson(json['menuItem'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num).toInt(),
  specialInstructions: json['specialInstructions'] as String?,
  customizations: (json['customizations'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CartItemDtoToJson(_CartItemDto instance) =>
    <String, dynamic>{
      'menuItem': instance.menuItem,
      'quantity': instance.quantity,
      'specialInstructions': instance.specialInstructions,
      'customizations': instance.customizations,
    };

_CartDto _$CartDtoFromJson(Map<String, dynamic> json) => _CartDto(
  id: json['id'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => CartItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  restaurantId: json['restaurantId'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$CartDtoToJson(_CartDto instance) => <String, dynamic>{
  'id': instance.id,
  'items': instance.items,
  'restaurantId': instance.restaurantId,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

_OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => _OrderDto(
  id: json['id'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => CartItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  subtotal: (json['subtotal'] as num).toDouble(),
  tax: (json['tax'] as num).toDouble(),
  total: (json['total'] as num).toDouble(),
  status: json['status'] as String,
  createdAt: json['createdAt'] as String,
  tableNumber: json['tableNumber'] as String?,
  specialInstructions: json['specialInstructions'] as String?,
  estimatedTime: json['estimatedTime'] as String?,
  completedAt: json['completedAt'] as String?,
);

Map<String, dynamic> _$OrderDtoToJson(_OrderDto instance) => <String, dynamic>{
  'id': instance.id,
  'items': instance.items,
  'subtotal': instance.subtotal,
  'tax': instance.tax,
  'total': instance.total,
  'status': instance.status,
  'createdAt': instance.createdAt,
  'tableNumber': instance.tableNumber,
  'specialInstructions': instance.specialInstructions,
  'estimatedTime': instance.estimatedTime,
  'completedAt': instance.completedAt,
};

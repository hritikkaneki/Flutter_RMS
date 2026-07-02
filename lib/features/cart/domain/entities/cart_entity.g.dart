// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItem _$CartItemFromJson(Map<String, dynamic> json) => _CartItem(
  menuItem: MenuItem.fromJson(json['menuItem'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num).toInt(),
  specialInstructions: json['specialInstructions'] as String?,
  customizations: (json['customizations'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CartItemToJson(_CartItem instance) => <String, dynamic>{
  'menuItem': instance.menuItem,
  'quantity': instance.quantity,
  'specialInstructions': instance.specialInstructions,
  'customizations': instance.customizations,
};

_Cart _$CartFromJson(Map<String, dynamic> json) => _Cart(
  id: json['id'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  restaurantId: json['restaurantId'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$CartToJson(_Cart instance) => <String, dynamic>{
  'id': instance.id,
  'items': instance.items,
  'restaurantId': instance.restaurantId,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: json['id'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  subtotal: (json['subtotal'] as num).toDouble(),
  tax: (json['tax'] as num).toDouble(),
  total: (json['total'] as num).toDouble(),
  status: $enumDecode(_$OrderStatusEnumMap, json['status']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  tableNumber: json['tableNumber'] as String?,
  specialInstructions: json['specialInstructions'] as String?,
  estimatedTime: json['estimatedTime'] as String?,
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'items': instance.items,
  'subtotal': instance.subtotal,
  'tax': instance.tax,
  'total': instance.total,
  'status': _$OrderStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'tableNumber': instance.tableNumber,
  'specialInstructions': instance.specialInstructions,
  'estimatedTime': instance.estimatedTime,
  'completedAt': instance.completedAt?.toIso8601String(),
};

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'PENDING',
  OrderStatus.confirmed: 'CONFIRMED',
  OrderStatus.preparing: 'PREPARING',
  OrderStatus.ready: 'READY',
  OrderStatus.completed: 'COMPLETED',
  OrderStatus.cancelled: 'CANCELLED',
};

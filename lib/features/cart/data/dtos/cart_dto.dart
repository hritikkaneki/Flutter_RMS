import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../menu/data/dtos/menu_dto.dart';

part 'cart_dto.freezed.dart';
part 'cart_dto.g.dart';

/// Cart item DTO
@freezed
class CartItemDto with _$CartItemDto {
  const CartItemDto._();

  const factory CartItemDto({
    required MenuItemDto menuItem,
    required int quantity,
    String? specialInstructions,
    List<String>? customizations,
  }) = _CartItemDto;

  factory CartItemDto.fromJson(Map<String, dynamic> json) =>
      _$CartItemDtoFromJson(json);
}

/// Cart DTO
@freezed
class CartDto with _$CartDto {
  const CartDto._();

  const factory CartDto({
    required String id,
    required List<CartItemDto> items,
    String? restaurantId,
    String? createdAt,
    String? updatedAt,
  }) = _CartDto;

  factory CartDto.fromJson(Map<String, dynamic> json) =>
      _$CartDtoFromJson(json);
}

/// Order DTO
@freezed
class OrderDto with _$OrderDto {
  const OrderDto._();

  const factory OrderDto({
    required String id,
    required List<CartItemDto> items,
    required double subtotal,
    required double tax,
    required double total,
    required String status,
    required String createdAt,
    String? tableNumber,
    String? specialInstructions,
    String? estimatedTime,
    String? completedAt,
  }) = _OrderDto;

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);
}

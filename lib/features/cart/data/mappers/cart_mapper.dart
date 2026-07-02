import '../../../menu/data/mappers/menu_mapper.dart';
import '../../domain/entities/cart_entity.dart';
import '../dtos/cart_dto.dart';

/// Mapper to convert between DTOs and Entities
class CartMapper {
  CartMapper._();

  // ══════════════════════════════════════════════════════════════════════════
  // Cart item mapping
  // ══════════════════════════════════════════════════════════════════════════

  /// Map CartItemDto to CartItem entity
  static CartItem cartItemDtoToEntity(CartItemDto dto) {
    return CartItem(
      menuItem: MenuMapper.menuItemDtoToEntity(dto.menuItem),
      quantity: dto.quantity,
      specialInstructions: dto.specialInstructions,
      customizations: dto.customizations,
    );
  }

  /// Map CartItem entity to CartItemDto
  static CartItemDto cartItemEntityToDto(CartItem entity) {
    return CartItemDto(
      menuItem: MenuMapper.menuItemEntityToDto(entity.menuItem),
      quantity: entity.quantity,
      specialInstructions: entity.specialInstructions,
      customizations: entity.customizations,
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Cart mapping
  // ══════════════════════════════════════════════════════════════════════════

  /// Map CartDto to Cart entity
  static Cart cartDtoToEntity(CartDto dto) {
    return Cart(
      id: dto.id,
      items: dto.items.map(cartItemDtoToEntity).toList(),
      restaurantId: dto.restaurantId,
      createdAt:
          dto.createdAt != null ? DateTime.tryParse(dto.createdAt!) : null,
      updatedAt:
          dto.updatedAt != null ? DateTime.tryParse(dto.updatedAt!) : null,
    );
  }

  /// Map Cart entity to CartDto
  static CartDto cartEntityToDto(Cart entity) {
    return CartDto(
      id: entity.id,
      items: entity.items.map(cartItemEntityToDto).toList(),
      restaurantId: entity.restaurantId,
      createdAt: entity.createdAt?.toIso8601String(),
      updatedAt: entity.updatedAt?.toIso8601String(),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Order mapping
  // ══════════════════════════════════════════════════════════════════════════

  /// Map OrderDto to Order entity
  static Order orderDtoToEntity(OrderDto dto) {
    return Order(
      id: dto.id,
      items: dto.items.map(cartItemDtoToEntity).toList(),
      subtotal: dto.subtotal,
      tax: dto.tax,
      total: dto.total,
      status: _mapOrderStatus(dto.status),
      createdAt: DateTime.tryParse(dto.createdAt) ?? DateTime.now(),
      tableNumber: dto.tableNumber,
      specialInstructions: dto.specialInstructions,
      estimatedTime: dto.estimatedTime,
      completedAt:
          dto.completedAt != null ? DateTime.tryParse(dto.completedAt!) : null,
    );
  }

  /// Map Order entity to OrderDto
  static OrderDto orderEntityToDto(Order entity) {
    return OrderDto(
      id: entity.id,
      items: entity.items.map(cartItemEntityToDto).toList(),
      subtotal: entity.subtotal,
      tax: entity.tax,
      total: entity.total,
      status: _mapOrderStatusToString(entity.status),
      createdAt: entity.createdAt.toIso8601String(),
      tableNumber: entity.tableNumber,
      specialInstructions: entity.specialInstructions,
      estimatedTime: entity.estimatedTime,
      completedAt: entity.completedAt?.toIso8601String(),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Private helpers
  // ══════════════════════════════════════════════════════════════════════════

  /// Map order status string to enum
  static OrderStatus _mapOrderStatus(String status) {
    switch (status.toUpperCase()) {
      case 'PENDING':
        return OrderStatus.pending;
      case 'CONFIRMED':
        return OrderStatus.confirmed;
      case 'PREPARING':
        return OrderStatus.preparing;
      case 'READY':
        return OrderStatus.ready;
      case 'COMPLETED':
        return OrderStatus.completed;
      case 'CANCELLED':
        return OrderStatus.cancelled;
      default:
        return OrderStatus.pending;
    }
  }

  /// Map OrderStatus enum to string
  static String _mapOrderStatusToString(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'PENDING';
      case OrderStatus.confirmed:
        return 'CONFIRMED';
      case OrderStatus.preparing:
        return 'PREPARING';
      case OrderStatus.ready:
        return 'READY';
      case OrderStatus.completed:
        return 'COMPLETED';
      case OrderStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

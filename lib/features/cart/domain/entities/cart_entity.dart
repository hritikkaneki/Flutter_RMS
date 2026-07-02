import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_management_system/features/menu/domain/entities/menu_entity.dart';

import 'package:restaurant_management_system/features/menu/domain/entities/menu_entity.dart';

part 'cart_entity.freezed.dart';
part 'cart_entity.g.dart';

/// Cart item entity - menu item with quantity in cart
@freezed
abstract class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    required MenuItem menuItem,
    required int quantity,
    String? specialInstructions,
    List<String>? customizations, // e.g., "Extra sauce", "No onions"
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  /// Get total price for this item
  double get totalPrice => menuItem.price * quantity;

  /// Check if item is available
  bool get isAvailable => menuItem.available;

  /// Get display text for this item
  String get displayText =>
      '${menuItem.name} x$quantity - ${displayTotal}';

  /// Get formatted total price
  String get displayTotal => '\$${totalPrice.toStringAsFixed(2)}';
}

/// Shopping cart entity
@freezed
abstract class Cart with _$Cart {
  const Cart._();

  const factory Cart({
    required String id,
    required List<CartItem> items,
    String? restaurantId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  /// Get total number of items (sum of quantities)
  int get totalItems => items.fold<int>(0, (sum, item) => sum + item.quantity);

  /// Get total price for all items
  double get subtotal => items.fold<double>(0, (sum, item) => sum + item.totalPrice);

  /// Get subtotal formatted
  String get subtotalDisplay => '\$${subtotal.toStringAsFixed(2)}';

  /// Get tax (assuming 10%)
  double get tax => subtotal * 0.10;

  /// Get tax formatted
  String get taxDisplay => '\$${tax.toStringAsFixed(2)}';

  /// Get total with tax
  double get total => subtotal + tax;

  /// Get total formatted
  String get totalDisplay => '\$${total.toStringAsFixed(2)}';

  /// Check if cart is empty
  bool get isEmpty => items.isEmpty;

  /// Check if cart has items
  bool get isNotEmpty => items.isNotEmpty;

  /// Check if all items are available
  bool get allItemsAvailable => items.every((item) => item.isAvailable);

  /// Add item to cart or increase quantity
  Cart addItem(CartItem item) {
    final existingIndex = items.indexWhere(
      (cartItem) => cartItem.menuItem.id == item.menuItem.id,
    );

    if (existingIndex >= 0) {
      // Item already in cart, increase quantity
      final updatedItems = [...items];
      updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
        quantity: updatedItems[existingIndex].quantity + item.quantity,
      );
      return copyWith(items: updatedItems, updatedAt: DateTime.now());
    } else {
      // New item, add to cart
      return copyWith(
        items: [...items, item],
        updatedAt: DateTime.now(),
      );
    }
  }

  /// Remove item from cart by menu item ID
  Cart removeItem(String menuItemId) {
    return copyWith(
      items: items.where((item) => item.menuItem.id != menuItemId).toList(),
      updatedAt: DateTime.now(),
    );
  }

  /// Update item quantity
  Cart updateItemQuantity(String menuItemId, int quantity) {
    if (quantity <= 0) {
      return removeItem(menuItemId);
    }

    final updatedItems = items.map((item) {
      if (item.menuItem.id == menuItemId) {
        return item.copyWith(quantity: quantity);
      }
      return item;
    }).toList();

    return copyWith(
      items: updatedItems,
      updatedAt: DateTime.now(),
    );
  }

  /// Update item special instructions
  Cart updateItemSpecialInstructions(
    String menuItemId,
    String specialInstructions,
  ) {
    final updatedItems = items.map((item) {
      if (item.menuItem.id == menuItemId) {
        return item.copyWith(specialInstructions: specialInstructions);
      }
      return item;
    }).toList();

    return copyWith(
      items: updatedItems,
      updatedAt: DateTime.now(),
    );
  }

  /// Clear cart
  Cart clear() {
    return copyWith(
      items: [],
      updatedAt: DateTime.now(),
    );
  }

  /// Get items by category
  List<CartItem> getItemsByCategory(MenuCategory category) {
    return items.where((item) => item.menuItem.category == category).toList();
  }

  /// Get summary for display
  String get summaryText {
    if (isEmpty) return 'Cart is empty';
    return '$totalItems items • ${totalDisplay}';
  }
}

/// Order entity - checkout data
@freezed
abstract class Order with _$Order {
  const Order._();

  const factory Order({
    required String id,
    required List<CartItem> items,
    required double subtotal,
    required double tax,
    required double total,
    required OrderStatus status,
    required DateTime createdAt,
    String? tableNumber,
    String? specialInstructions,
    String? estimatedTime, // e.g., "25-30 mins"
    DateTime? completedAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  /// Convert cart to order
  static Order fromCart(Cart cart, {String? tableNumber}) {
    return Order(
      id: '', // Will be assigned by server
      items: cart.items,
      subtotal: cart.subtotal,
      tax: cart.tax,
      total: cart.total,
      status: OrderStatus.pending,
      createdAt: DateTime.now(),
      tableNumber: tableNumber,
    );
  }

  /// Get total formatted
  String get totalDisplay => '\$${total.toStringAsFixed(2)}';

  /// Get status display text
  String get statusDisplay {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.confirmed:
        return 'Confirmed';
      case OrderStatus.preparing:
        return 'Preparing';
      case OrderStatus.ready:
        return 'Ready';
      case OrderStatus.completed:
        return 'Completed';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  /// Get status icon emoji
  String get statusIcon {
    switch (status) {
      case OrderStatus.pending:
        return '⏳';
      case OrderStatus.confirmed:
        return '✅';
      case OrderStatus.preparing:
        return '👨‍🍳';
      case OrderStatus.ready:
        return '🎉';
      case OrderStatus.completed:
        return '✔️';
      case OrderStatus.cancelled:
        return '❌';
    }
  }

  bool get isCompleted => true;
}

/// Order status enum
enum OrderStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('CONFIRMED')
  confirmed,
  @JsonValue('PREPARING')
  preparing,
  @JsonValue('READY')
  ready,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('CANCELLED')
  cancelled,
}

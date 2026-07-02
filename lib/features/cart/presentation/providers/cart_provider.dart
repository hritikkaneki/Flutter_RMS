import 'package:dartz/dartz.dart' hide Order;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_management_system/core/error/failures.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/cart_entity.dart';
import '../../domain/usecases/cart_usecases.dart';
import '../../../menu/domain/entities/menu_entity.dart';

part 'cart_provider.g.dart';

// ══════════════════════════════════════════════════════════════════════════
// Cart State Providers
// ══════════════════════════════════════════════════════════════════════════

/// Current cart provider
@riverpod
Future<Cart> cart(Ref ref) async {
  final result = await ref.watch(getCartUseCaseProvider).call();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (cart) => cart,
  );
}

/// Order history provider
@riverpod
Future<List<Order>> orderHistory(Ref ref) async {
  final result = await ref.watch(getOrderHistoryUseCaseProvider).call();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (orders) => orders,
  );
}

/// Specific order provider
@riverpod
Future<Order> orderById(Ref ref, String orderId) async {
  final result = await ref.watch(getOrderByIdUseCaseProvider).call(orderId);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (order) => order,
  );
}

// ══════════════════════════════════════════════════════════════════════════
// Cart Mutation Providers
// ══════════════════════════════════════════════════════════════════════════

/// Notifier for managing cart operations
@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Future<Cart> build() async {
    final result = await ref.watch(getCartUseCaseProvider).call();
    return result.fold(
      (failure) => throw Exception(failure.message),
      (cart) => cart,
    );
  }

  /// Add item to cart
  Future<void> addItem(MenuItem menuItem, {String? specialInstructions}) async {
    final cartItem = CartItem(
      menuItem: menuItem,
      quantity: 1,
      specialInstructions: specialInstructions,
    );

    final result = await ref.read(addToCartUseCaseProvider).call(cartItem);
    result.fold(
      (failure) => throw Exception(failure.message),
      (updatedCart) => state = AsyncValue.data(updatedCart),
    );
  }

  /// Remove item from cart
  Future<void> removeItem(String menuItemId) async {
    final result =
        await ref.read(removeFromCartUseCaseProvider).call(menuItemId);
    result.fold(
      (failure) => throw Exception(failure.message),
      (updatedCart) => state = AsyncValue.data(updatedCart),
    );
  }

  /// Update item quantity
  Future<void> updateQuantity(String menuItemId, int quantity) async {
    final result = await ref
        .read(updateItemQuantityUseCaseProvider)
        .call(menuItemId, quantity);
    result.fold(
      (failure) => throw Exception(failure.message),
      (updatedCart) => state = AsyncValue.data(updatedCart),
    );
  }

  /// Increment item quantity
  Future<void> increment(String menuItemId) async {
    final cart = state.value;
    if (cart != null) {
      final item = cart.items.firstWhere((i) => i.menuItem.id == menuItemId);
      await updateQuantity(menuItemId, item.quantity + 1);
    }
  }

  /// Decrement item quantity
  Future<void> decrement(String menuItemId) async {
    final cart = state.value;
    if (cart != null) {
      final item = cart.items.firstWhere((i) => i.menuItem.id == menuItemId);
      if (item.quantity > 1) {
        await updateQuantity(menuItemId, item.quantity - 1);
      } else {
        await removeItem(menuItemId);
      }
    }
  }

  /// Update special instructions
  Future<void> updateSpecialInstructions(
    String menuItemId,
    String specialInstructions,
  ) async {
    final result = await ref
        .read(updateItemSpecialInstructionsUseCaseProvider)
        .call(menuItemId, specialInstructions);
    result.fold(
      (failure) => throw Exception(failure.message),
      (updatedCart) => state = AsyncValue.data(updatedCart),
    );
  }

  /// Clear cart
  Future<void> clear() async {
    final result = await ref.read(clearCartUseCaseProvider).call();
    result.fold(
      (failure) => throw Exception(failure.message),
      (updatedCart) => state = AsyncValue.data(updatedCart),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════════
// Checkout Provider
// ══════════════════════════════════════════════════════════════════════════

/// Checkout state notifier
@riverpod
class CheckoutNotifier extends _$CheckoutNotifier {
  @override
  AsyncValue<Order> build() {
    return AsyncValue.data(Order(
      id: '',
      items: const [],
      subtotal: 0,
      tax: 0,
      total: 0,
      status: OrderStatus.pending,
      createdAt: DateTime.now(),
    ));
  }

  /// Perform checkout
  Future<Either<Failure, Order>> checkout({
    required String tableNumber,
    String? specialInstructions,
  }) async {
    state = const AsyncValue.loading();

    final result = await ref.read(checkoutUseCaseProvider).call(
          tableNumber: tableNumber,
          specialInstructions: specialInstructions,
        );

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
        throw Exception(failure.message);
      },
      (order) {
        state = AsyncValue.data(order);
        return order;
      },
    );

    return result;
  }

  /// Clear order state
  void reset() {
    state = AsyncValue.data(Order(
      id: '',
      items: const [],
      subtotal: 0,
      tax: 0,
      total: 0,
      status: OrderStatus.pending,
      createdAt: DateTime.now(),
    ));
  }
}

// ══════════════════════════════════════════════════════════════════════════
// UI State Providers
// ══════════════════════════════════════════════════════════════════════════

/// Table number input state
@riverpod
class TableNumberInput extends _$TableNumberInput {
  @override
  String build() => '';

  void update(String value) => state = value;
}

/// Special instructions input state
@riverpod
class SpecialInstructionsInput extends _$SpecialInstructionsInput {
  @override
  String build() => '';

  void update(String value) => state = value;
}

/// Order filter state (for order history)
enum OrderFilter { all, pending, completed, cancelled }

@riverpod
class OrderHistoryFilter extends _$OrderHistoryFilter {
  @override
  OrderFilter build() => OrderFilter.all;

  void setFilter(OrderFilter filter) => state = filter;
}

/// Filtered order history
@riverpod
Future<List<Order>> filteredOrderHistory(Ref ref) async {
  final orders = await ref.watch(orderHistoryProvider.future);
  final filter = ref.watch(orderHistoryFilterProvider);

  return orders.where((order) {
    switch (filter) {
      case OrderFilter.pending:
        return !order.isCompleted;
      case OrderFilter.completed:
        return order.isCompleted;
      case OrderFilter.cancelled:
        return order.status == OrderStatus.cancelled;
      case OrderFilter.all:
        return true;
    }
  }).toList();
}

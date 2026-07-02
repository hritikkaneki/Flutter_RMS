import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/storage/hive_storage.dart';
import '../../domain/entities/cart_entity.dart';
import '../mappers/cart_mapper.dart';

part 'cart_local_datasource.g.dart';

/// Cart local data source provider
@riverpod
CartLocalDataSource cartLocalDataSource(Ref ref) {
  return CartLocalDataSourceImpl(ref.watch(hiveStorageProvider));
}

/// Abstract interface for cart local data source
abstract class CartLocalDataSource {
  /// Get cart from local storage
  Future<Cart?> getCart();

  /// Save cart to local storage
  Future<void> saveCart(Cart cart);

  /// Clear cart from local storage
  Future<void> clearCart();

  /// Get order history from local storage
  Future<List<Order>> getOrderHistory();

  /// Save order to local storage
  Future<void> saveOrder(Order order);

  /// Get order by ID from local storage
  Future<Order?> getOrderById(String orderId);

  /// Clear order history from local storage
  Future<void> clearOrderHistory();
}

/// Implementation of cart local data source using Hive
class CartLocalDataSourceImpl implements CartLocalDataSource {
  static const String _cartKey = 'current_cart';
  static const String _ordersKey = 'order_history';
  static const String _orderPrefix = 'order_';

  final HiveStorage _storage;

  CartLocalDataSourceImpl(this._storage);

  @override
  Future<Cart?> getCart() async {
    try {
      final cart = await _storage.get(_cartKey) as Cart?;
      return cart;
    } catch (e) {
      throw CacheException('Failed to get cart: ${e.toString()}');
    }
  }

  @override
  Future<void> saveCart(Cart cart) async {
    try {
      await _storage.put(_cartKey, cart);
    } catch (e) {
      throw CacheException('Failed to save cart: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCart() async {
    try {
      await _storage.delete(_cartKey);
    } catch (e) {
      throw CacheException('Failed to clear cart: ${e.toString()}');
    }
  }

  @override
  Future<List<Order>> getOrderHistory() async {
    try {
      final orderIds = await _storage.get(_ordersKey) as List<String>? ?? [];
      final orders = <Order>[];

      for (final orderId in orderIds) {
        final order =
            await _storage.get('$_orderPrefix$orderId') as Order?;
        if (order != null) {
          orders.add(order);
        }
      }

      // Sort by creation date (newest first)
      orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return orders;
    } catch (e) {
      throw CacheException('Failed to get order history: ${e.toString()}');
    }
  }

  @override
  Future<void> saveOrder(Order order) async {
    try {
      // Save order
      await _storage.put('$_orderPrefix${order.id}', order);

      // Add order ID to history list
      final orderIds = await _storage.get(_ordersKey) as List<String>? ?? [];
      if (!orderIds.contains(order.id)) {
        orderIds.add(order.id);
        await _storage.put(_ordersKey, orderIds);
      }
    } catch (e) {
      throw CacheException('Failed to save order: ${e.toString()}');
    }
  }

  @override
  Future<Order?> getOrderById(String orderId) async {
    try {
      final order =
          await _storage.get('$_orderPrefix$orderId') as Order?;
      return order;
    } catch (e) {
      throw CacheException('Failed to get order: ${e.toString()}');
    }
  }

  @override
  Future<void> clearOrderHistory() async {
    try {
      final orderIds = await _storage.get(_ordersKey) as List<String>? ?? [];
      for (final orderId in orderIds) {
        await _storage.delete('$_orderPrefix$orderId');
      }
      await _storage.delete(_ordersKey);
    } catch (e) {
      throw CacheException('Failed to clear order history: ${e.toString()}');
    }
  }
}

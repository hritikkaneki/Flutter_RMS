import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import this to use 'Ref'
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/storage/hive_storage.dart';
import '../../domain/entities/cart_entity.dart';
import '../mappers/cart_mapper.dart';
import '../dtos//cart_dto.dart';   // Ensure these paths point to your actual DTO models
import '../dtos//order_dto.dart';  // Ensure these paths point to your actual DTO models

part 'cart_local_datasource.g.dart';

/// Cart local data source provider
@riverpod
CartLocalDataSource cartLocalDataSource(Ref ref) { // FIXED: Switched to generic 'Ref' temporarily to allow generator to compile
  final storage = ref.watch(hiveStorageProvider).requireValue;
  return CartLocalDataSourceImpl(storage);
}

/// Abstract interface for cart local data source
abstract class CartLocalDataSource {
  Future<Cart?> getCart();
  Future<void> saveCart(Cart cart);
  Future<void> clearCart();
  Future<List<Order>> getOrderHistory();
  Future<void> saveOrder(Order order);
  Future<Order?> getOrderById(String orderId);
  Future<void> clearOrderHistory();
}

/// Implementation of cart local data source using Hive
class CartLocalDataSourceImpl implements CartLocalDataSource {
  static const String _cartBox = 'cart_cache_box';
  static const String _cartKey = 'current_cart';
  static const String _ordersKey = 'order_history';
  static const String _orderPrefix = 'order_';

  final HiveStorage _storage;

  CartLocalDataSourceImpl(this._storage);

  @override
  Future<Cart?> getCart() async {
    try {
      final dynamic cachedString = await _storage.get(_cartBox, _cartKey);
      if (cachedString == null) return null;

      final Map<String, dynamic> rawMap = jsonDecode(cachedString as String) as Map<String, dynamic>;

      // FIXED: Used DTO deserialization and Mapper conversion sequence instead of direct jsonToCartEntity
      final dto = CartDto.fromJson(rawMap);
      return CartMapper.cartDtoToEntity(dto);
    } catch (e) {
      throw CacheException('Failed to get cart: ${e.toString()}');
    }
  }

  @override
  Future<void> saveCart(Cart cart) async {
    try {
      final cartDto = CartMapper.cartEntityToDto(cart);
      final jsonString = jsonEncode(cartDto.toJson());
      await _storage.put(_cartBox, _cartKey, jsonString);
    } catch (e) {
      throw CacheException('Failed to save cart: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCart() async {
    try {
      await _storage.delete(_cartBox, _cartKey);
    } catch (e) {
      throw CacheException('Failed to clear cart: ${e.toString()}');
    }
  }

  @override
  Future<List<Order>> getOrderHistory() async {
    try {
      final dynamic cachedString = await _storage.get(_cartBox, _ordersKey);
      if (cachedString == null) return <Order>[];

      final List<dynamic> rawList = jsonDecode(cachedString as String) as List<dynamic>;
      final List<String> orderIds = rawList.cast<String>();
      final orders = <Order>[];

      for (final orderId in orderIds) {
        final dynamic orderString = await _storage.get(_cartBox, '$_orderPrefix$orderId');
        if (orderString != null) {
          final Map<String, dynamic> orderMap = jsonDecode(orderString as String) as Map<String, dynamic>;

          // FIXED: Use OrderDto and Mapper conversion sequence instead of direct jsonToOrderEntity
          final dto = OrderDto.fromJson(orderMap);
          orders.add(CartMapper.orderDtoToEntity(dto));
        }
      }

      orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return orders;
    } catch (e) {
      throw CacheException('Failed to get order history: ${e.toString()}');
    }
  }

  @override
  Future<void> saveOrder(Order order) async {
    try {
      final orderDto = CartMapper.orderEntityToDto(order);
      final jsonString = jsonEncode(orderDto.toJson());
      await _storage.put(_cartBox, '$_orderPrefix${order.id}', jsonString);

      final dynamic cachedString = await _storage.get(_cartBox, _ordersKey);
      List<String> orderIds = [];
      if (cachedString != null) {
        final List<dynamic> rawList = jsonDecode(cachedString as String) as List<dynamic>;
        orderIds = rawList.cast<String>();
      }

      if (!orderIds.contains(order.id)) {
        orderIds.add(order.id);
        final historyString = jsonEncode(orderIds);
        await _storage.put(_cartBox, _ordersKey, historyString);
      }
    } catch (e) {
      throw CacheException('Failed to save order: ${e.toString()}');
    }
  }

  @override
  Future<Order?> getOrderById(String orderId) async {
    try {
      final dynamic orderString = await _storage.get(_cartBox, '$_orderPrefix$orderId');
      if (orderString == null) return null;

      final Map<String, dynamic> orderMap = jsonDecode(orderString as String) as Map<String, dynamic>;

      // FIXED: Use OrderDto and Mapper conversion sequence instead of direct jsonToOrderEntity
      final dto = OrderDto.fromJson(orderMap);
      return CartMapper.orderDtoToEntity(dto);
    } catch (e) {
      throw CacheException('Failed to get order: ${e.toString()}');
    }
  }

  @override
  Future<void> clearOrderHistory() async {
    try {
      final dynamic cachedString = await _storage.get(_cartBox, _ordersKey);
      if (cachedString != null) {
        final List<dynamic> rawList = jsonDecode(cachedString as String) as List<dynamic>;
        final List<String> orderIds = rawList.cast<String>();

        for (final orderId in orderIds) {
          await _storage.delete(_cartBox, '$_orderPrefix$orderId');
        }
      }
      await _storage.delete(_cartBox, _ordersKey);
    } catch (e) {
      throw CacheException('Failed to clear order history: ${e.toString()}');
    }
  }
}

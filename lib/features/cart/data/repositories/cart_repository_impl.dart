import 'package:dartz/dartz.dart' hide Order;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_local_datasource.dart';
import '../datasources/cart_remote_datasource.dart';

part 'cart_repository_impl.g.dart';

/// Cart repository provider
@riverpod
CartRepository cartRepository(Ref ref) {
  return CartRepositoryImpl(
    ref.watch(cartRemoteDataSourceProvider),
    ref.watch(cartLocalDataSourceProvider),
  );
}

/// Implementation of cart repository
class CartRepositoryImpl implements CartRepository {
  static const String _cartCacheKey = 'current_cart';

  final CartRemoteDataSource _remoteDataSource;
  final CartLocalDataSource _localDataSource;

  CartRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, Cart>> getCart() async {
    try {
      // Try to load from local storage first
      final cart = await _localDataSource.getCart();
      if (cart != null) {
        return Right(cart);
      }

      // Return empty cart if not found
      return Right(
        Cart(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          items: [],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> addToCart(CartItem item) async {
    try {
      final currentCart = await _localDataSource.getCart();
      final updatedCart = (currentCart ?? Cart(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        items: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ))
          .addItem(item);

      await _localDataSource.saveCart(updatedCart);
      return Right(updatedCart);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> removeFromCart(String menuItemId) async {
    try {
      final cart = await _localDataSource.getCart();
      if (cart == null) {
        return Left(Failure.cache('Cart not found'));
      }

      final updatedCart = cart.removeItem(menuItemId);
      await _localDataSource.saveCart(updatedCart);
      return Right(updatedCart);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> updateItemQuantity(
    String menuItemId,
    int quantity,
  ) async {
    try {
      final cart = await _localDataSource.getCart();
      if (cart == null) {
        return Left(Failure.cache('Cart not found'));
      }

      final updatedCart = cart.updateItemQuantity(menuItemId, quantity);
      await _localDataSource.saveCart(updatedCart);
      return Right(updatedCart);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> updateItemSpecialInstructions(
    String menuItemId,
    String specialInstructions,
  ) async {
    try {
      final cart = await _localDataSource.getCart();
      if (cart == null) {
        return Left(Failure.cache('Cart not found'));
      }

      final updatedCart =
          cart.updateItemSpecialInstructions(menuItemId, specialInstructions);
      await _localDataSource.saveCart(updatedCart);
      return Right(updatedCart);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> clearCart() async {
    try {
      await _localDataSource.clearCart();
      return Right(
        Cart(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          items: [],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveCart(Cart cart) async {
    try {
      await _localDataSource.saveCart(cart);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart?>> loadCart() async {
    try {
      final cart = await _localDataSource.getCart();
      return Right(cart);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Order>> checkout({
    required String tableNumber,
    String? specialInstructions,
  }) async {
    try {
      final cart = await _localDataSource.getCart();
      if (cart == null || cart.items.isEmpty) {
        return Left(Failure.validation('Cart is empty'));
      }

      final order = await _remoteDataSource.submitOrder(
        items: cart.items,
        subtotal: cart.subtotal,
        tax: cart.tax,
        total: cart.total,
        tableNumber: tableNumber,
        specialInstructions: specialInstructions,
      );

      // Save order to local storage
      await _localDataSource.saveOrder(order);

      // Clear cart after successful checkout
      await _localDataSource.clearCart();

      return Right(order);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return const Left(Failure.network());
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Order>>> getOrderHistory() async {
    try {
      final orders = await _localDataSource.getOrderHistory();
      return Right(orders);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return const Left(Failure.network());
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Order>> getOrderById(String orderId) async {
    try {
      final order = await _localDataSource.getOrderById(orderId);
      if (order != null) {
        return Right(order);
      }

      // If not found locally, try server
      final remoteOrder = await _remoteDataSource.getOrderById(orderId);
      await _localDataSource.saveOrder(remoteOrder);
      return Right(remoteOrder);
    } on NotFoundException catch (e) {
      return Left(Failure.notFound(e.message));
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return const Left(Failure.network());
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cancelOrder(String orderId) async {
    try {
      await _remoteDataSource.cancelOrder(orderId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return const Left(Failure.network());
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }
}

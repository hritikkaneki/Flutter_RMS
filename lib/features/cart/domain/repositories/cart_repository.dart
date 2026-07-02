import 'package:dartz/dartz.dart' hide Order;

import '../../../../core/error/failures.dart';
import '../entities/cart_entity.dart';

/// Abstract repository for cart operations
abstract class CartRepository {
  /// Get current cart
  Future<Either<Failure, Cart>> getCart();

  /// Add item to cart
  Future<Either<Failure, Cart>> addToCart(CartItem item);

  /// Remove item from cart
  Future<Either<Failure, Cart>> removeFromCart(String menuItemId);

  /// Update item quantity
  Future<Either<Failure, Cart>> updateItemQuantity(
    String menuItemId,
    int quantity,
  );

  /// Update item special instructions
  Future<Either<Failure, Cart>> updateItemSpecialInstructions(
    String menuItemId,
    String specialInstructions,
  );

  /// Clear cart
  Future<Either<Failure, Cart>> clearCart();

  /// Save cart to local storage
  Future<Either<Failure, void>> saveCart(Cart cart);

  /// Load cart from local storage
  Future<Either<Failure, Cart?>> loadCart();

  /// Checkout - create order
  Future<Either<Failure, Order>> checkout({
    required String tableNumber,
    String? specialInstructions,
  });

  /// Get order history
  Future<Either<Failure, List<Order>>> getOrderHistory();

  /// Get order by ID
  Future<Either<Failure, Order>> getOrderById(String orderId);

  /// Cancel order
  Future<Either<Failure, void>> cancelOrder(String orderId);
}

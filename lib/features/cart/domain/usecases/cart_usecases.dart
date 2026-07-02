import 'package:dartz/dartz.dart' hide Order;
import 'package:restaurant_management_system/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../entities/cart_entity.dart';
import '../repositories/cart_repository.dart';

part 'cart_usecases.g.dart';

/// ============================================================================
/// GetCartUseCase
/// ============================================================================

class GetCartUseCase {
  final CartRepository repository;

  GetCartUseCase(this.repository);

  Future<Either<Failure, Cart>> call() => repository.getCart();
}

@riverpod
GetCartUseCase getCartUseCase(Ref ref) {
  return GetCartUseCase(ref.watch(cartRepositoryProvider));
}

/// ============================================================================
/// AddToCartUseCase
/// ============================================================================

class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<Either<Failure, Cart>> call(CartItem item) =>
      repository.addToCart(item);
}

@riverpod
AddToCartUseCase addToCartUseCase(Ref ref) {
  return AddToCartUseCase(ref.watch(cartRepositoryProvider));
}

/// ============================================================================
/// RemoveFromCartUseCase
/// ============================================================================

class RemoveFromCartUseCase {
  final CartRepository repository;

  RemoveFromCartUseCase(this.repository);

  Future<Either<Failure, Cart>> call(String menuItemId) =>
      repository.removeFromCart(menuItemId);
}

@riverpod
RemoveFromCartUseCase removeFromCartUseCase(Ref ref) {
  return RemoveFromCartUseCase(ref.watch(cartRepositoryProvider));
}

/// ============================================================================
/// UpdateItemQuantityUseCase
/// ============================================================================

class UpdateItemQuantityUseCase {
  final CartRepository repository;

  UpdateItemQuantityUseCase(this.repository);

  Future<Either<Failure, Cart>> call(String menuItemId, int quantity) =>
      repository.updateItemQuantity(menuItemId, quantity);
}

@riverpod
UpdateItemQuantityUseCase updateItemQuantityUseCase(Ref ref) {
  return UpdateItemQuantityUseCase(ref.watch(cartRepositoryProvider));
}

/// ============================================================================
/// UpdateItemSpecialInstructionsUseCase
/// ============================================================================

class UpdateItemSpecialInstructionsUseCase {
  final CartRepository repository;

  UpdateItemSpecialInstructionsUseCase(this.repository);

  Future<Either<Failure, Cart>> call(
    String menuItemId,
    String specialInstructions,
  ) =>
      repository.updateItemSpecialInstructions(menuItemId, specialInstructions);
}

@riverpod
UpdateItemSpecialInstructionsUseCase updateItemSpecialInstructionsUseCase(
  Ref ref,
) {
  return UpdateItemSpecialInstructionsUseCase(
    ref.watch(cartRepositoryProvider),
  );
}

/// ============================================================================
/// ClearCartUseCase
/// ============================================================================

class ClearCartUseCase {
  final CartRepository repository;

  ClearCartUseCase(this.repository);

  Future<Either<Failure, Cart>> call() => repository.clearCart();
}

@riverpod
ClearCartUseCase clearCartUseCase(Ref ref) {
  return ClearCartUseCase(ref.watch(cartRepositoryProvider));
}

/// ============================================================================
/// CheckoutUseCase
/// ============================================================================

class CheckoutUseCase {
  final CartRepository repository;

  CheckoutUseCase(this.repository);

  Future<Either<Failure, Order>> call({
    required String tableNumber,
    String? specialInstructions,
  }) =>
      repository.checkout(
        tableNumber: tableNumber,
        specialInstructions: specialInstructions,
      );
}

@riverpod
CheckoutUseCase checkoutUseCase(Ref ref) {
  return CheckoutUseCase(ref.watch(cartRepositoryProvider));
}

/// ============================================================================
/// GetOrderHistoryUseCase
/// ============================================================================

class GetOrderHistoryUseCase {
  final CartRepository repository;

  GetOrderHistoryUseCase(this.repository);

  Future<Either<Failure, List<Order>>> call() => repository.getOrderHistory();
}

@riverpod
GetOrderHistoryUseCase getOrderHistoryUseCase(Ref ref) {
  return GetOrderHistoryUseCase(ref.watch(cartRepositoryProvider));
}

/// ============================================================================
/// GetOrderByIdUseCase
/// ============================================================================

class GetOrderByIdUseCase {
  final CartRepository repository;

  GetOrderByIdUseCase(this.repository);

  Future<Either<Failure, Order>> call(String orderId) =>
      repository.getOrderById(orderId);
}

@riverpod
GetOrderByIdUseCase getOrderByIdUseCase(Ref ref) {
  return GetOrderByIdUseCase(ref.watch(cartRepositoryProvider));
}

/// ============================================================================
/// CancelOrderUseCase
/// ============================================================================

class CancelOrderUseCase {
  final CartRepository repository;

  CancelOrderUseCase(this.repository);

  Future<Either<Failure, void>> call(String orderId) =>
      repository.cancelOrder(orderId);
}

@riverpod
CancelOrderUseCase cancelOrderUseCase(Ref ref) {
  return CancelOrderUseCase(ref.watch(cartRepositoryProvider));
}

/// ============================================================================
/// SaveCartUseCase
/// ============================================================================

class SaveCartUseCase {
  final CartRepository repository;

  SaveCartUseCase(this.repository);

  Future<Either<Failure, void>> call(Cart cart) => repository.saveCart(cart);
}

@riverpod
SaveCartUseCase saveCartUseCase(Ref ref) {
  return SaveCartUseCase(ref.watch(cartRepositoryProvider));
}

/// ============================================================================
/// LoadCartUseCase
/// ============================================================================

class LoadCartUseCase {
  final CartRepository repository;

  LoadCartUseCase(this.repository);

  Future<Either<Failure, Cart?>> call() => repository.loadCart();
}

@riverpod
LoadCartUseCase loadCartUseCase(Ref ref) {
  return LoadCartUseCase(ref.watch(cartRepositoryProvider));
}

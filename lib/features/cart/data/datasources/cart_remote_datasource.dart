import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/entities/cart_entity.dart';
import '../dtos/cart_dto.dart';
import '../mappers/cart_mapper.dart';

part 'cart_remote_datasource.g.dart';

/// Cart remote data source provider
@riverpod
CartRemoteDataSource cartRemoteDataSource(Ref ref) {
  return CartRemoteDataSourceImpl(ref.watch(dioProvider));
}

/// Abstract interface for cart remote data source
abstract class CartRemoteDataSource {
  /// Submit order (checkout)
  Future<Order> submitOrder({
    required List<CartItem> items,
    required double subtotal,
    required double tax,
    required double total,
    String? tableNumber,
    String? specialInstructions,
  });

  /// Get order history from server
  Future<List<Order>> getOrderHistory();

  /// Get order by ID from server
  Future<Order> getOrderById(String orderId);

  /// Cancel order
  Future<void> cancelOrder(String orderId);

  /// Get order status
  Future<Order> getOrderStatus(String orderId);
}

/// Implementation of cart remote data source
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Dio _dio;

  CartRemoteDataSourceImpl(this._dio);

  @override
  Future<Order> submitOrder({
    required List<CartItem> items,
    required double subtotal,
    required double tax,
    required double total,
    String? tableNumber,
    String? specialInstructions,
  }) async {
    try {
      final requestBody = {
        'items': items
            .map((item) => {
                  'menuItemId': item.menuItem.id,
                  'quantity': item.quantity,
                  'specialInstructions': item.specialInstructions,
                })
            .toList(),
        'tableNumber': tableNumber,
        'specialInstructions': specialInstructions,
        'subtotal': subtotal,
        'tax': tax,
        'total': total,
      };

      final response = await _dio.post(
        ApiEndpoints.orders,
        data: requestBody,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'] as Map<String, dynamic>;
        final orderDto = OrderDto.fromJson(data);
        return CartMapper.orderDtoToEntity(orderDto);
      } else {
        throw ServerException(
          'Failed to submit order',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<List<Order>> getOrderHistory() async {
    try {
      final response = await _dio.get(ApiEndpoints.orders);

      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;
        return data
            .map((order) =>
                CartMapper.orderDtoToEntity(OrderDto.fromJson(order as Map<String, dynamic>)))
            .toList();
      } else {
        throw ServerException(
          'Failed to fetch order history',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<Order> getOrderById(String orderId) async {
    try {
      final response = await _dio.get('${ApiEndpoints.orders}/$orderId');

      if (response.statusCode == 200) {
        final data = response.data['data'] as Map<String, dynamic>;
        final orderDto = OrderDto.fromJson(data);
        return CartMapper.orderDtoToEntity(orderDto);
      } else {
        throw ServerException(
          'Failed to fetch order',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<void> cancelOrder(String orderId) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.cancelOrder(orderId),
      );

      if (response.statusCode != 200) {
        throw ServerException(
          'Failed to cancel order',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<Order> getOrderStatus(String orderId) async {
    try {
      final response = await _dio.get('${ApiEndpoints.orders}/$orderId');

      if (response.statusCode == 200) {
        final data = response.data['data'] as Map<String, dynamic>;
        final orderDto = OrderDto.fromJson(data);
        return CartMapper.orderDtoToEntity(orderDto);
      } else {
        throw ServerException(
          'Failed to fetch order status',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  /// Handle Dio exceptions
  void _handleDioException(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final data = e.response!.data;
      final message = (data is Map<String, dynamic>
              ? data['message'] as String?
              : null) ??
          e.message ??
          'Unknown error';

      if (statusCode == 404) {
        throw NotFoundException(message);
      } else if (statusCode == 401) {
        throw UnauthorizedException(message);
      } else if (statusCode != null && statusCode >= 500) {
        throw ServerException(message, statusCode);
      }
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      throw NetworkException('Network connection error');
    }

    throw ServerException(e.message ?? 'Unknown error');
  }
}

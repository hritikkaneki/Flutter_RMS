import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../dtos/menu_dto.dart';

part 'menu_remote_datasource.g.dart';

/// Menu remote data source provider
@riverpod
MenuRemoteDataSource menuRemoteDataSource(Ref ref) {
  return MenuRemoteDataSourceImpl(ref.watch(dioProvider));
}

/// Abstract interface for menu remote data source
abstract class MenuRemoteDataSource {
  /// Get complete menu
  Future<MenuDto> getMenu();

  /// Get menu items by category
  Future<List<MenuItemDto>> getItemsByCategory(String category);

  /// Search menu items
  Future<List<MenuItemDto>> searchItems(String query);

  /// Get vegetarian items
  Future<List<MenuItemDto>> getVegetarianItems();

  /// Get items without allergen
  Future<List<MenuItemDto>> getItemsWithoutAllergen(String allergen);

  /// Get menu item by ID
  Future<MenuItemDto> getItemById(String itemId);
}

/// Implementation of menu remote data source
class MenuRemoteDataSourceImpl implements MenuRemoteDataSource {
  final Dio _dio;

  MenuRemoteDataSourceImpl(this._dio);

  @override
  Future<MenuDto> getMenu() async {
    try {
      final response = await _dio.get(ApiEndpoints.menu);

      if (response.statusCode == 200) {
        final data = response.data['data'] as Map<String, dynamic>;
        return MenuDto.fromJson(data);
      } else {
        throw ServerException(
          'Failed to fetch menu with status: ${response.statusCode}',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<List<MenuItemDto>> getItemsByCategory(String category) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.menuByCategory,
        queryParameters: {'category': category},
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;
        return data
            .map((item) => MenuItemDto.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw ServerException(
          'Failed to fetch items by category',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<List<MenuItemDto>> searchItems(String query) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.menuSearch,
        queryParameters: {'q': query},
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;
        return data
            .map((item) => MenuItemDto.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw ServerException(
          'Failed to search menu items',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<List<MenuItemDto>> getVegetarianItems() async {
    try {
      final response = await _dio.get(ApiEndpoints.menuVegetarian);

      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;
        return data
            .map((item) => MenuItemDto.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw ServerException(
          'Failed to fetch vegetarian items',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<List<MenuItemDto>> getItemsWithoutAllergen(String allergen) async {
    try {
      final response = await _dio.get(
        ApiEndpoints.menuAllergen,
        queryParameters: {'allergen': allergen},
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;
        return data
            .map((item) => MenuItemDto.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw ServerException(
          'Failed to fetch items without allergen',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  @override
  Future<MenuItemDto> getItemById(String itemId) async {
    try {
      final response = await _dio.get('${ApiEndpoints.menu}/$itemId');

      if (response.statusCode == 200) {
        final data = response.data['data'] as Map<String, dynamic>;
        return MenuItemDto.fromJson(data);
      } else {
        throw ServerException(
          'Failed to fetch menu item',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  /// Handle Dio exceptions and throw appropriate app exceptions
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

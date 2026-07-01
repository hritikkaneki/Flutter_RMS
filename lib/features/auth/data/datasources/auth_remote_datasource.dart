import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../dtos/login_request_dto.dart';
import '../dtos/login_response_dto.dart';

part 'auth_remote_datasource.g.dart';

/// Auth remote data source provider
@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSourceImpl(ref.watch(dioProvider));
}

/// Abstract interface for auth remote data source
abstract class AuthRemoteDataSource {
  /// Login with email and password
  Future<LoginResponseDto> login({
    required String email,
    required String password,
  });

  /// Logout
  Future<void> logout();

  /// Refresh access token
  Future<AuthTokensDto> refreshToken(String refreshToken);
}

/// Implementation of auth remote data source
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<LoginResponseDto> login({
    required String email,
    required String password,
  }) async {
    try {
      final requestDto = LoginRequestDto(
        email: email,
        password: password,
      );

      final response = await _dio.post(
        ApiEndpoints.login,
        data: requestDto.toJson(),
      );

      // Parse response based on backend format
      // Expected: { "success": true, "message": "...", "data": {...} }
      if (response.statusCode == 200) {
        final data = response.data['data'] as Map<String, dynamic>;
        return LoginResponseDto.fromJson(data);
      } else {
        throw ServerException(
          'Login failed with status: ${response.statusCode}',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final statusCode = e.response!.statusCode;
        final message = e.response!.data?['message'] ?? e.message ?? 'Unknown error';

        if (statusCode == 401) {
          throw UnauthorizedException(message);
        } else if (statusCode == 400) {
          throw ValidationException(message);
        } else if (statusCode == 429) {
          throw RateLimitException(message);
        } else if (statusCode != null && statusCode >= 500) {
          throw ServerException(message, statusCode);
        }
      }

      // Network error
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw NetworkException('Network connection error');
      }

      throw ServerException(e.message ?? 'Unknown error');
    } catch (e) {
      throw ServerException('Unexpected error: $e');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _dio.post(ApiEndpoints.logout);
    } on DioException catch (e) {
      // Logout errors are non-critical - we'll clear local data anyway
      throw ServerException(
        e.response?.data?['message'] ?? 'Logout failed',
        e.response?.statusCode,
      );
    }
  }

  @override
  Future<AuthTokensDto> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] as Map<String, dynamic>;
        return AuthTokensDto.fromJson(data);
      } else {
        throw ServerException(
          'Token refresh failed',
          response.statusCode,
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizedException('Refresh token expired');
      }
      throw ServerException(
        e.response?.data?['message'] ?? 'Token refresh failed',
        e.response?.statusCode,
      );
    }
  }
}

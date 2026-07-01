import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/storage/hive_storage.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../domain/entities/user_entity.dart';
import '../dtos/login_response_dto.dart';
import '../mappers/auth_mapper.dart';

part 'auth_local_datasource.g.dart';

/// Auth local data source provider
@riverpod
Future<AuthLocalDataSource> authLocalDataSource(Ref ref) async {
  final hiveStorage = await ref.watch(hiveStorageProvider.future);
  return AuthLocalDataSourceImpl(
    ref.watch(secureStorageProvider),
    hiveStorage,
  );
}

/// Abstract interface for auth local data source
abstract class AuthLocalDataSource {
  /// Save user to local storage
  Future<void> cacheUser(UserEntity user);

  /// Get cached user
  Future<UserEntity?> getCachedUser();

  /// Save auth tokens
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });

  /// Get access token
  Future<String?> getAccessToken();

  /// Get refresh token
  Future<String?> getRefreshToken();

  /// Clear all auth data
  Future<void> clearAuthData();
}

/// Implementation of auth local data source
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorage _secureStorage;
  final HiveStorage _hiveStorage;

  AuthLocalDataSourceImpl(this._secureStorage, this._hiveStorage);

  @override
  Future<void> cacheUser(UserEntity user) async {
    try {
      // Convert entity to DTO for storage
      final dto = AuthMapper.userEntityToDto(user);
      final jsonString = jsonEncode(dto.toJson());

      // Save to Hive
      await _hiveStorage.put(
        HiveBoxes.user,
        AppConstants.userKey,
        jsonString,
      );
    } catch (e) {
      throw CacheException('Failed to cache user: $e');
    }
  }

  @override
  Future<UserEntity?> getCachedUser() async {
    try {
      final jsonString = await _hiveStorage.get<String>(
        HiveBoxes.user,
        AppConstants.userKey,
      );

      if (jsonString == null) return null;

      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      final dto = UserDto.fromJson(json);
      return AuthMapper.userDtoToEntity(dto);
    } catch (e) {
      throw CacheException('Failed to get cached user: $e');
    }
  }

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await Future.wait([
        _secureStorage.saveAccessToken(accessToken),
        _secureStorage.saveRefreshToken(refreshToken),
      ]);
    } catch (e) {
      throw CacheException('Failed to save tokens: $e');
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      return await _secureStorage.getAccessToken();
    } catch (e) {
      throw CacheException('Failed to get access token: $e');
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      return await _secureStorage.getRefreshToken();
    } catch (e) {
      throw CacheException('Failed to get refresh token: $e');
    }
  }

  @override
  Future<void> clearAuthData() async {
    try {
      await Future.wait([
        _secureStorage.clearAuthTokens(),
        _hiveStorage.delete(HiveBoxes.user, AppConstants.userKey),
      ]);
    } catch (e) {
      throw CacheException('Failed to clear auth data: $e');
    }
  }
}

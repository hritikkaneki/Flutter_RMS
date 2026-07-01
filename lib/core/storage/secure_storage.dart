import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/app_constants.dart';

part 'secure_storage.g.dart';

/// Secure storage provider
@riverpod
SecureStorage secureStorage(Ref ref) {
  return SecureStorage(const FlutterSecureStorage());
}

/// Secure storage for sensitive data (tokens, credentials)
class SecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorage(this._storage);

  // ══════════════════════════════════════════════════════════════════════════
  // Auth tokens
  // ══════════════════════════════════════════════════════════════════════════

  /// Save access token
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: AppConstants.accessTokenKey, value: token);
  }

  /// Get access token
  Future<String?> getAccessToken() async {
    return _storage.read(key: AppConstants.accessTokenKey);
  }

  /// Save refresh token
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: AppConstants.refreshTokenKey, value: token);
  }

  /// Get refresh token
  Future<String?> getRefreshToken() async {
    return _storage.read(key: AppConstants.refreshTokenKey);
  }

  /// Delete access token
  Future<void> deleteAccessToken() async {
    await _storage.delete(key: AppConstants.accessTokenKey);
  }

  /// Delete refresh token
  Future<void> deleteRefreshToken() async {
    await _storage.delete(key: AppConstants.refreshTokenKey);
  }

  /// Clear all auth tokens
  Future<void> clearAuthTokens() async {
    await Future.wait([
      deleteAccessToken(),
      deleteRefreshToken(),
    ]);
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Generic operations
  // ══════════════════════════════════════════════════════════════════════════

  /// Save generic string value
  Future<void> saveString(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Get generic string value
  Future<String?> getString(String key) async {
    return _storage.read(key: key);
  }

  /// Delete generic value
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Clear all secure storage
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  /// Check if key exists
  Future<bool> containsKey(String key) async {
    return (await _storage.read(key: key)) != null;
  }
}

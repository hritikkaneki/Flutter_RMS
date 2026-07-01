import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';

/// Abstract auth repository interface (contract)
/// Implementation will be in data layer
abstract class AuthRepository {
  /// Login with email and password
  /// Returns Either<Failure, LoginResponseEntity>
  Future<Either<Failure, LoginResponseEntity>> login({
    required String email,
    required String password,
  });

  /// Logout - invalidate tokens
  Future<Either<Failure, Unit>> logout();

  /// Refresh access token using refresh token
  Future<Either<Failure, AuthTokensEntity>> refreshToken(String refreshToken);

  /// Get cached user (from local storage)
  Future<Either<Failure, UserEntity?>> getCachedUser();

  /// Check if user is logged in
  Future<bool> isLoggedIn();

  /// Clear all auth data (tokens + user)
  Future<void> clearAuthData();
}

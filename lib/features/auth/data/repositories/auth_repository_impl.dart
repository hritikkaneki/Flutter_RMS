import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';
import '../mappers/auth_mapper.dart';

part 'auth_repository_impl.g.dart';

/// Auth repository provider
@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    ref.watch(authRemoteDataSourceProvider),
    ref.watch(authLocalDataSourceProvider).requireValue,
    ref.watch(networkInfoProvider),
  );
}

/// Implementation of auth repository
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, LoginResponseEntity>> login({
    required String email,
    required String password,
  }) async {
    // Check network connectivity
    if (!await _networkInfo.isConnected) {
      return const Left(Failure.network());
    }

    try {
      // Call remote API
      final dto = await _remoteDataSource.login(
        email: email,
        password: password,
      );

      // Map DTO to Entity
      final entity = AuthMapper.loginResponseDtoToEntity(dto);

      // Cache user locally
      await _localDataSource.cacheUser(entity.user);

      // Save tokens
      await _localDataSource.saveTokens(
        accessToken: entity.tokens.accessToken,
        refreshToken: entity.tokens.refreshToken,
      );

      return Right(entity);
    } on UnauthorizedException catch (e) {
      return Left(Failure.unauthorized());
    } on ValidationException catch (e) {
      return Left(Failure.validation(e.message));
    } on NetworkException catch (e) {
      return const Left(Failure.network());
    } on RateLimitException catch (e) {
      return Left(Failure.rateLimit(e.message));
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      // Try to call remote logout (best effort)
      if (await _networkInfo.isConnected) {
        try {
          await _remoteDataSource.logout();
        } catch (e) {
          // Ignore remote logout errors
        }
      }

      // Clear local data (this always succeeds)
      await _localDataSource.clearAuthData();

      return const Right(unit);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthTokensEntity>> refreshToken(
    String refreshToken,
  ) async {
    // Check network connectivity
    if (!await _networkInfo.isConnected) {
      return const Left(Failure.network());
    }

    try {
      // Call remote API
      final dto = await _remoteDataSource.refreshToken(refreshToken);

      // Map to entity
      final entity = AuthMapper.tokensDtoToEntity(dto);

      // Save new tokens
      await _localDataSource.saveTokens(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
      );

      return Right(entity);
    } on UnauthorizedException catch (e) {
      // Refresh token expired - clear auth data
      await _localDataSource.clearAuthData();
      return const Left(Failure.unauthorized());
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCachedUser() async {
    try {
      final user = await _localDataSource.getCachedUser();
      return Right(user);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    try {
      final accessToken = await _localDataSource.getAccessToken();
      return accessToken != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> clearAuthData() async {
    await _localDataSource.clearAuthData();
  }
}

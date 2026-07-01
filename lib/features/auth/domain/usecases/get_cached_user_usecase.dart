import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

part 'get_cached_user_usecase.g.dart';

/// Get cached user use case provider
@riverpod
GetCachedUserUseCase getCachedUserUseCase(Ref ref) {
  return GetCachedUserUseCase(ref.watch(authRepositoryProvider));
}

/// Get cached user use case (for splash screen / app startup)
class GetCachedUserUseCase {
  final AuthRepository _repository;

  GetCachedUserUseCase(this._repository);

  /// Execute - get cached user
  Future<Either<Failure, UserEntity?>> call() async {
    return _repository.getCachedUser();
  }
}

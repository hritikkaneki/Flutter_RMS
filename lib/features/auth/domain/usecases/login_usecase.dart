import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

part 'login_usecase.g.dart';

/// Login use case provider
@riverpod
LoginUseCase loginUseCase(Ref ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
}

/// Login parameters
class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

/// Login use case - encapsulates business logic for login
class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  /// Execute login
  Future<Either<Failure, LoginResponseEntity>> call(LoginParams params) async {
    // Validate email
    if (params.email.isEmpty) {
      return const Left(Failure.validation('Email is required'));
    }

    // Validate password
    if (params.password.isEmpty) {
      return const Left(Failure.validation('Password is required'));
    }

    // Call repository
    return _repository.login(
      email: params.email,
      password: params.password,
    );
  }
}

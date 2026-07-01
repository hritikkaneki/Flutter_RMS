import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_cached_user_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';

part 'auth_provider.g.dart';

/// Auth state notifier provider
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<UserEntity?> build() async {
    // Check if user is cached on app startup
    final result = await ref.read(getCachedUserUseCaseProvider).call();
    return result.fold(
      (failure) => null,
      (user) => user,
    );
  }

  /// Login with email and password
  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();

    final result = await ref.read(loginUseCaseProvider).call(
          LoginParams(email: email, password: password),
        );

    state = result.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (response) => AsyncValue.data(response.user),
    );
  }

  /// Logout
  Future<void> logout() async {
    state = const AsyncValue.loading();

    final result = await ref.read(logoutUseCaseProvider).call();

    state = result.fold(
      (failure) => AsyncValue.error(failure, StackTrace.current),
      (_) => const AsyncValue.data(null),
    );
  }

  /// Clear error state
  void clearError() {
    if (state.hasError) {
      state = state.isLoading
          ? const AsyncValue.loading()
          : AsyncValue.data(state.value);
    }
  }
}

/// Helper provider to check if user is authenticated
@riverpod
bool isAuthenticated(Ref ref) {
  final authState = ref.watch(authProvider);
  return authState.value != null;
}

/// Helper provider to get current user
@riverpod
UserEntity? currentUser(Ref ref) {
  final authState = ref.watch(authProvider);
  return authState.value;
}

/// Helper provider to get current user role
@riverpod
UserRole? currentUserRole(Ref ref) {
  final user = ref.watch(currentUserProvider);
  return user?.role;
}

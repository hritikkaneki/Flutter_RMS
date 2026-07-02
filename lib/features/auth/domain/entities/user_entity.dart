import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

/// User roles in the system
enum UserRole {
  @JsonValue('ADMIN')
  admin,
  @JsonValue('MANAGER')
  manager,
  @JsonValue('WAITER')
  waiter,
  @JsonValue('CHEF')
  chef,
}

/// Extension to get display name for user role
extension UserRoleX on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.admin:
        return 'Admin';
      case UserRole.manager:
        return 'Manager';
      case UserRole.waiter:
        return 'Waiter';
      case UserRole.chef:
        return 'Chef';
    }
  }

  String get description {
    switch (this) {
      case UserRole.admin:
        return 'Full system access';
      case UserRole.manager:
        return 'Manage staff and reports';
      case UserRole.waiter:
        return 'Take orders and serve';
      case UserRole.chef:
        return 'Kitchen operations';
    }
  }
}

/// User entity - domain model
@freezed
abstract class UserEntity with _$UserEntity {

  const factory UserEntity({
    required String id,
    required String email,
    required String name,
    required UserRole role,
    required bool active,
    String? phone,
    String? avatar,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserEntity;
  const UserEntity._();

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

 }

/// Auth tokens entity
@freezed
 abstract class AuthTokensEntity with _$AuthTokensEntity {

  const factory AuthTokensEntity({
    required String accessToken,
    required String refreshToken,
  }) = _AuthTokensEntity;
  const AuthTokensEntity._();

  factory AuthTokensEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensEntityFromJson(json);

 }

/// Login response entity
@freezed
abstract class LoginResponseEntity with _$LoginResponseEntity {

  const factory LoginResponseEntity({
    required UserEntity user,
    required AuthTokensEntity tokens,
  }) = _LoginResponseEntity;
  const LoginResponseEntity._();

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseEntityFromJson(json);
}

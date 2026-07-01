import '../../domain/entities/user_entity.dart';
import '../dtos/login_response_dto.dart';

/// Mapper to convert between DTOs and Entities
class AuthMapper {
  AuthMapper._();

  // ══════════════════════════════════════════════════════════════════════════
  // User mapping
  // ══════════════════════════════════════════════════════════════════════════

  /// Map UserDto to UserEntity
  static UserEntity userDtoToEntity(UserDto dto) {
    return UserEntity(
      id: dto.id,
      email: dto.email,
      name: dto.name,
      role: _mapRole(dto.role),
      active: dto.active,
      phone: dto.phone,
      avatar: dto.avatar,
      createdAt: dto.createdAt != null ? DateTime.tryParse(dto.createdAt!) : null,
      updatedAt: dto.updatedAt != null ? DateTime.tryParse(dto.updatedAt!) : null,
    );
  }

  /// Map UserEntity to UserDto
  static UserDto userEntityToDto(UserEntity entity) {
    return UserDto(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      role: _mapRoleToString(entity.role),
      active: entity.active,
      phone: entity.phone,
      avatar: entity.avatar,
      createdAt: entity.createdAt?.toIso8601String(),
      updatedAt: entity.updatedAt?.toIso8601String(),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Auth tokens mapping
  // ══════════════════════════════════════════════════════════════════════════

  /// Map AuthTokensDto to AuthTokensEntity
  static AuthTokensEntity tokensDtoToEntity(AuthTokensDto dto) {
    return AuthTokensEntity(
      accessToken: dto.accessToken,
      refreshToken: dto.refreshToken,
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Login response mapping
  // ══════════════════════════════════════════════════════════════════════════

  /// Map LoginResponseDto to LoginResponseEntity
  static LoginResponseEntity loginResponseDtoToEntity(LoginResponseDto dto) {
    return LoginResponseEntity(
      user: userDtoToEntity(dto.user),
      tokens: AuthTokensEntity(
        accessToken: dto.accessToken,
        refreshToken: dto.refreshToken,
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Private helpers
  // ══════════════════════════════════════════════════════════════════════════

  /// Map role string to UserRole enum
  static UserRole _mapRole(String role) {
    switch (role.toUpperCase()) {
      case 'ADMIN':
        return UserRole.admin;
      case 'MANAGER':
        return UserRole.manager;
      case 'WAITER':
        return UserRole.waiter;
      case 'CHEF':
        return UserRole.chef;
      default:
        throw ArgumentError('Unknown role: $role');
    }
  }

  /// Map UserRole enum to string
  static String _mapRoleToString(UserRole role) {
    switch (role) {
      case UserRole.admin:
        return 'ADMIN';
      case UserRole.manager:
        return 'MANAGER';
      case UserRole.waiter:
        return 'WAITER';
      case UserRole.chef:
        return 'CHEF';
    }
  }
}

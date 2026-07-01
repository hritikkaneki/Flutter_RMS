// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  active: json['active'] as bool,
  phone: json['phone'] as String?,
  avatar: json['avatar'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'role': _$UserRoleEnumMap[instance.role]!,
      'active': instance.active,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'ADMIN',
  UserRole.manager: 'MANAGER',
  UserRole.waiter: 'WAITER',
  UserRole.chef: 'CHEF',
};

_AuthTokensEntity _$AuthTokensEntityFromJson(Map<String, dynamic> json) =>
    _AuthTokensEntity(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AuthTokensEntityToJson(_AuthTokensEntity instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

_LoginResponseEntity _$LoginResponseEntityFromJson(Map<String, dynamic> json) =>
    _LoginResponseEntity(
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      tokens: AuthTokensEntity.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseEntityToJson(
  _LoginResponseEntity instance,
) => <String, dynamic>{'user': instance.user, 'tokens': instance.tokens};

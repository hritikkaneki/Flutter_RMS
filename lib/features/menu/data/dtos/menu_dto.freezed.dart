// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuItemDto {

 String get id; String get name; String get description; String get category; double get price; bool get available; String? get imageUrl; String? get notes; int? get preparationTime; List<String>? get allergens; bool? get isVegetarian; bool? get isSpicy; String? get createdAt; String? get updatedAt;
/// Create a copy of MenuItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemDtoCopyWith<MenuItemDto> get copyWith => _$MenuItemDtoCopyWithImpl<MenuItemDto>(this as MenuItemDto, _$identity);

  /// Serializes this MenuItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.available, available) || other.available == available)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.preparationTime, preparationTime) || other.preparationTime == preparationTime)&&const DeepCollectionEquality().equals(other.allergens, allergens)&&(identical(other.isVegetarian, isVegetarian) || other.isVegetarian == isVegetarian)&&(identical(other.isSpicy, isSpicy) || other.isSpicy == isSpicy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,category,price,available,imageUrl,notes,preparationTime,const DeepCollectionEquality().hash(allergens),isVegetarian,isSpicy,createdAt,updatedAt);

@override
String toString() {
  return 'MenuItemDto(id: $id, name: $name, description: $description, category: $category, price: $price, available: $available, imageUrl: $imageUrl, notes: $notes, preparationTime: $preparationTime, allergens: $allergens, isVegetarian: $isVegetarian, isSpicy: $isSpicy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MenuItemDtoCopyWith<$Res>  {
  factory $MenuItemDtoCopyWith(MenuItemDto value, $Res Function(MenuItemDto) _then) = _$MenuItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String category, double price, bool available, String? imageUrl, String? notes, int? preparationTime, List<String>? allergens, bool? isVegetarian, bool? isSpicy, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$MenuItemDtoCopyWithImpl<$Res>
    implements $MenuItemDtoCopyWith<$Res> {
  _$MenuItemDtoCopyWithImpl(this._self, this._then);

  final MenuItemDto _self;
  final $Res Function(MenuItemDto) _then;

/// Create a copy of MenuItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? category = null,Object? price = null,Object? available = null,Object? imageUrl = freezed,Object? notes = freezed,Object? preparationTime = freezed,Object? allergens = freezed,Object? isVegetarian = freezed,Object? isSpicy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,preparationTime: freezed == preparationTime ? _self.preparationTime : preparationTime // ignore: cast_nullable_to_non_nullable
as int?,allergens: freezed == allergens ? _self.allergens : allergens // ignore: cast_nullable_to_non_nullable
as List<String>?,isVegetarian: freezed == isVegetarian ? _self.isVegetarian : isVegetarian // ignore: cast_nullable_to_non_nullable
as bool?,isSpicy: freezed == isSpicy ? _self.isSpicy : isSpicy // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuItemDto].
extension MenuItemDtoPatterns on MenuItemDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItemDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItemDto value)  $default,){
final _that = this;
switch (_that) {
case _MenuItemDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItemDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String category,  double price,  bool available,  String? imageUrl,  String? notes,  int? preparationTime,  List<String>? allergens,  bool? isVegetarian,  bool? isSpicy,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItemDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.category,_that.price,_that.available,_that.imageUrl,_that.notes,_that.preparationTime,_that.allergens,_that.isVegetarian,_that.isSpicy,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String category,  double price,  bool available,  String? imageUrl,  String? notes,  int? preparationTime,  List<String>? allergens,  bool? isVegetarian,  bool? isSpicy,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MenuItemDto():
return $default(_that.id,_that.name,_that.description,_that.category,_that.price,_that.available,_that.imageUrl,_that.notes,_that.preparationTime,_that.allergens,_that.isVegetarian,_that.isSpicy,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String category,  double price,  bool available,  String? imageUrl,  String? notes,  int? preparationTime,  List<String>? allergens,  bool? isVegetarian,  bool? isSpicy,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MenuItemDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.category,_that.price,_that.available,_that.imageUrl,_that.notes,_that.preparationTime,_that.allergens,_that.isVegetarian,_that.isSpicy,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItemDto extends MenuItemDto {
  const _MenuItemDto({required this.id, required this.name, required this.description, required this.category, required this.price, required this.available, this.imageUrl, this.notes, this.preparationTime, final  List<String>? allergens, this.isVegetarian, this.isSpicy, this.createdAt, this.updatedAt}): _allergens = allergens,super._();
  factory _MenuItemDto.fromJson(Map<String, dynamic> json) => _$MenuItemDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String category;
@override final  double price;
@override final  bool available;
@override final  String? imageUrl;
@override final  String? notes;
@override final  int? preparationTime;
 final  List<String>? _allergens;
@override List<String>? get allergens {
  final value = _allergens;
  if (value == null) return null;
  if (_allergens is EqualUnmodifiableListView) return _allergens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? isVegetarian;
@override final  bool? isSpicy;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of MenuItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemDtoCopyWith<_MenuItemDto> get copyWith => __$MenuItemDtoCopyWithImpl<_MenuItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.available, available) || other.available == available)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.preparationTime, preparationTime) || other.preparationTime == preparationTime)&&const DeepCollectionEquality().equals(other._allergens, _allergens)&&(identical(other.isVegetarian, isVegetarian) || other.isVegetarian == isVegetarian)&&(identical(other.isSpicy, isSpicy) || other.isSpicy == isSpicy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,category,price,available,imageUrl,notes,preparationTime,const DeepCollectionEquality().hash(_allergens),isVegetarian,isSpicy,createdAt,updatedAt);

@override
String toString() {
  return 'MenuItemDto(id: $id, name: $name, description: $description, category: $category, price: $price, available: $available, imageUrl: $imageUrl, notes: $notes, preparationTime: $preparationTime, allergens: $allergens, isVegetarian: $isVegetarian, isSpicy: $isSpicy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MenuItemDtoCopyWith<$Res> implements $MenuItemDtoCopyWith<$Res> {
  factory _$MenuItemDtoCopyWith(_MenuItemDto value, $Res Function(_MenuItemDto) _then) = __$MenuItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String category, double price, bool available, String? imageUrl, String? notes, int? preparationTime, List<String>? allergens, bool? isVegetarian, bool? isSpicy, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$MenuItemDtoCopyWithImpl<$Res>
    implements _$MenuItemDtoCopyWith<$Res> {
  __$MenuItemDtoCopyWithImpl(this._self, this._then);

  final _MenuItemDto _self;
  final $Res Function(_MenuItemDto) _then;

/// Create a copy of MenuItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? category = null,Object? price = null,Object? available = null,Object? imageUrl = freezed,Object? notes = freezed,Object? preparationTime = freezed,Object? allergens = freezed,Object? isVegetarian = freezed,Object? isSpicy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_MenuItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,preparationTime: freezed == preparationTime ? _self.preparationTime : preparationTime // ignore: cast_nullable_to_non_nullable
as int?,allergens: freezed == allergens ? _self._allergens : allergens // ignore: cast_nullable_to_non_nullable
as List<String>?,isVegetarian: freezed == isVegetarian ? _self.isVegetarian : isVegetarian // ignore: cast_nullable_to_non_nullable
as bool?,isSpicy: freezed == isSpicy ? _self.isSpicy : isSpicy // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MenuSectionDto {

 String get category; List<MenuItemDto> get items;
/// Create a copy of MenuSectionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuSectionDtoCopyWith<MenuSectionDto> get copyWith => _$MenuSectionDtoCopyWithImpl<MenuSectionDto>(this as MenuSectionDto, _$identity);

  /// Serializes this MenuSectionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuSectionDto&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'MenuSectionDto(category: $category, items: $items)';
}


}

/// @nodoc
abstract mixin class $MenuSectionDtoCopyWith<$Res>  {
  factory $MenuSectionDtoCopyWith(MenuSectionDto value, $Res Function(MenuSectionDto) _then) = _$MenuSectionDtoCopyWithImpl;
@useResult
$Res call({
 String category, List<MenuItemDto> items
});




}
/// @nodoc
class _$MenuSectionDtoCopyWithImpl<$Res>
    implements $MenuSectionDtoCopyWith<$Res> {
  _$MenuSectionDtoCopyWithImpl(this._self, this._then);

  final MenuSectionDto _self;
  final $Res Function(MenuSectionDto) _then;

/// Create a copy of MenuSectionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? items = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItemDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuSectionDto].
extension MenuSectionDtoPatterns on MenuSectionDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuSectionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuSectionDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuSectionDto value)  $default,){
final _that = this;
switch (_that) {
case _MenuSectionDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuSectionDto value)?  $default,){
final _that = this;
switch (_that) {
case _MenuSectionDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category,  List<MenuItemDto> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuSectionDto() when $default != null:
return $default(_that.category,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category,  List<MenuItemDto> items)  $default,) {final _that = this;
switch (_that) {
case _MenuSectionDto():
return $default(_that.category,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category,  List<MenuItemDto> items)?  $default,) {final _that = this;
switch (_that) {
case _MenuSectionDto() when $default != null:
return $default(_that.category,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuSectionDto extends MenuSectionDto {
  const _MenuSectionDto({required this.category, required final  List<MenuItemDto> items}): _items = items,super._();
  factory _MenuSectionDto.fromJson(Map<String, dynamic> json) => _$MenuSectionDtoFromJson(json);

@override final  String category;
 final  List<MenuItemDto> _items;
@override List<MenuItemDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of MenuSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuSectionDtoCopyWith<_MenuSectionDto> get copyWith => __$MenuSectionDtoCopyWithImpl<_MenuSectionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuSectionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuSectionDto&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MenuSectionDto(category: $category, items: $items)';
}


}

/// @nodoc
abstract mixin class _$MenuSectionDtoCopyWith<$Res> implements $MenuSectionDtoCopyWith<$Res> {
  factory _$MenuSectionDtoCopyWith(_MenuSectionDto value, $Res Function(_MenuSectionDto) _then) = __$MenuSectionDtoCopyWithImpl;
@override @useResult
$Res call({
 String category, List<MenuItemDto> items
});




}
/// @nodoc
class __$MenuSectionDtoCopyWithImpl<$Res>
    implements _$MenuSectionDtoCopyWith<$Res> {
  __$MenuSectionDtoCopyWithImpl(this._self, this._then);

  final _MenuSectionDto _self;
  final $Res Function(_MenuSectionDto) _then;

/// Create a copy of MenuSectionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? items = null,}) {
  return _then(_MenuSectionDto(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItemDto>,
  ));
}


}


/// @nodoc
mixin _$MenuDto {

 String get id; String get restaurantId; List<MenuSectionDto> get sections; String get lastUpdated; String? get version;
/// Create a copy of MenuDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuDtoCopyWith<MenuDto> get copyWith => _$MenuDtoCopyWithImpl<MenuDto>(this as MenuDto, _$identity);

  /// Serializes this MenuDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuDto&&(identical(other.id, id) || other.id == id)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&const DeepCollectionEquality().equals(other.sections, sections)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,restaurantId,const DeepCollectionEquality().hash(sections),lastUpdated,version);

@override
String toString() {
  return 'MenuDto(id: $id, restaurantId: $restaurantId, sections: $sections, lastUpdated: $lastUpdated, version: $version)';
}


}

/// @nodoc
abstract mixin class $MenuDtoCopyWith<$Res>  {
  factory $MenuDtoCopyWith(MenuDto value, $Res Function(MenuDto) _then) = _$MenuDtoCopyWithImpl;
@useResult
$Res call({
 String id, String restaurantId, List<MenuSectionDto> sections, String lastUpdated, String? version
});




}
/// @nodoc
class _$MenuDtoCopyWithImpl<$Res>
    implements $MenuDtoCopyWith<$Res> {
  _$MenuDtoCopyWithImpl(this._self, this._then);

  final MenuDto _self;
  final $Res Function(MenuDto) _then;

/// Create a copy of MenuDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? restaurantId = null,Object? sections = null,Object? lastUpdated = null,Object? version = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<MenuSectionDto>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuDto].
extension MenuDtoPatterns on MenuDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuDto value)  $default,){
final _that = this;
switch (_that) {
case _MenuDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuDto value)?  $default,){
final _that = this;
switch (_that) {
case _MenuDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String restaurantId,  List<MenuSectionDto> sections,  String lastUpdated,  String? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuDto() when $default != null:
return $default(_that.id,_that.restaurantId,_that.sections,_that.lastUpdated,_that.version);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String restaurantId,  List<MenuSectionDto> sections,  String lastUpdated,  String? version)  $default,) {final _that = this;
switch (_that) {
case _MenuDto():
return $default(_that.id,_that.restaurantId,_that.sections,_that.lastUpdated,_that.version);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String restaurantId,  List<MenuSectionDto> sections,  String lastUpdated,  String? version)?  $default,) {final _that = this;
switch (_that) {
case _MenuDto() when $default != null:
return $default(_that.id,_that.restaurantId,_that.sections,_that.lastUpdated,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuDto extends MenuDto {
  const _MenuDto({required this.id, required this.restaurantId, required final  List<MenuSectionDto> sections, required this.lastUpdated, this.version}): _sections = sections,super._();
  factory _MenuDto.fromJson(Map<String, dynamic> json) => _$MenuDtoFromJson(json);

@override final  String id;
@override final  String restaurantId;
 final  List<MenuSectionDto> _sections;
@override List<MenuSectionDto> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}

@override final  String lastUpdated;
@override final  String? version;

/// Create a copy of MenuDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuDtoCopyWith<_MenuDto> get copyWith => __$MenuDtoCopyWithImpl<_MenuDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuDto&&(identical(other.id, id) || other.id == id)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&const DeepCollectionEquality().equals(other._sections, _sections)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,restaurantId,const DeepCollectionEquality().hash(_sections),lastUpdated,version);

@override
String toString() {
  return 'MenuDto(id: $id, restaurantId: $restaurantId, sections: $sections, lastUpdated: $lastUpdated, version: $version)';
}


}

/// @nodoc
abstract mixin class _$MenuDtoCopyWith<$Res> implements $MenuDtoCopyWith<$Res> {
  factory _$MenuDtoCopyWith(_MenuDto value, $Res Function(_MenuDto) _then) = __$MenuDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String restaurantId, List<MenuSectionDto> sections, String lastUpdated, String? version
});




}
/// @nodoc
class __$MenuDtoCopyWithImpl<$Res>
    implements _$MenuDtoCopyWith<$Res> {
  __$MenuDtoCopyWithImpl(this._self, this._then);

  final _MenuDto _self;
  final $Res Function(_MenuDto) _then;

/// Create a copy of MenuDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? restaurantId = null,Object? sections = null,Object? lastUpdated = null,Object? version = freezed,}) {
  return _then(_MenuDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<MenuSectionDto>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

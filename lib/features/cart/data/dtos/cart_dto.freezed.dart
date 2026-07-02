// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartItemDto {

 MenuItemDto get menuItem; int get quantity; String? get specialInstructions; List<String>? get customizations;
/// Create a copy of CartItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemDtoCopyWith<CartItemDto> get copyWith => _$CartItemDtoCopyWithImpl<CartItemDto>(this as CartItemDto, _$identity);

  /// Serializes this CartItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItemDto&&(identical(other.menuItem, menuItem) || other.menuItem == menuItem)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&const DeepCollectionEquality().equals(other.customizations, customizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItem,quantity,specialInstructions,const DeepCollectionEquality().hash(customizations));

@override
String toString() {
  return 'CartItemDto(menuItem: $menuItem, quantity: $quantity, specialInstructions: $specialInstructions, customizations: $customizations)';
}


}

/// @nodoc
abstract mixin class $CartItemDtoCopyWith<$Res>  {
  factory $CartItemDtoCopyWith(CartItemDto value, $Res Function(CartItemDto) _then) = _$CartItemDtoCopyWithImpl;
@useResult
$Res call({
 MenuItemDto menuItem, int quantity, String? specialInstructions, List<String>? customizations
});


$MenuItemDtoCopyWith<$Res> get menuItem;

}
/// @nodoc
class _$CartItemDtoCopyWithImpl<$Res>
    implements $CartItemDtoCopyWith<$Res> {
  _$CartItemDtoCopyWithImpl(this._self, this._then);

  final CartItemDto _self;
  final $Res Function(CartItemDto) _then;

/// Create a copy of CartItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuItem = null,Object? quantity = null,Object? specialInstructions = freezed,Object? customizations = freezed,}) {
  return _then(_self.copyWith(
menuItem: null == menuItem ? _self.menuItem : menuItem // ignore: cast_nullable_to_non_nullable
as MenuItemDto,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,customizations: freezed == customizations ? _self.customizations : customizations // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of CartItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemDtoCopyWith<$Res> get menuItem {
  
  return $MenuItemDtoCopyWith<$Res>(_self.menuItem, (value) {
    return _then(_self.copyWith(menuItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartItemDto].
extension CartItemDtoPatterns on CartItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItemDto value)  $default,){
final _that = this;
switch (_that) {
case _CartItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _CartItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MenuItemDto menuItem,  int quantity,  String? specialInstructions,  List<String>? customizations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItemDto() when $default != null:
return $default(_that.menuItem,_that.quantity,_that.specialInstructions,_that.customizations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MenuItemDto menuItem,  int quantity,  String? specialInstructions,  List<String>? customizations)  $default,) {final _that = this;
switch (_that) {
case _CartItemDto():
return $default(_that.menuItem,_that.quantity,_that.specialInstructions,_that.customizations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MenuItemDto menuItem,  int quantity,  String? specialInstructions,  List<String>? customizations)?  $default,) {final _that = this;
switch (_that) {
case _CartItemDto() when $default != null:
return $default(_that.menuItem,_that.quantity,_that.specialInstructions,_that.customizations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartItemDto extends CartItemDto {
  const _CartItemDto({required this.menuItem, required this.quantity, this.specialInstructions, final  List<String>? customizations}): _customizations = customizations,super._();
  factory _CartItemDto.fromJson(Map<String, dynamic> json) => _$CartItemDtoFromJson(json);

@override final  MenuItemDto menuItem;
@override final  int quantity;
@override final  String? specialInstructions;
 final  List<String>? _customizations;
@override List<String>? get customizations {
  final value = _customizations;
  if (value == null) return null;
  if (_customizations is EqualUnmodifiableListView) return _customizations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CartItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemDtoCopyWith<_CartItemDto> get copyWith => __$CartItemDtoCopyWithImpl<_CartItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItemDto&&(identical(other.menuItem, menuItem) || other.menuItem == menuItem)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&const DeepCollectionEquality().equals(other._customizations, _customizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItem,quantity,specialInstructions,const DeepCollectionEquality().hash(_customizations));

@override
String toString() {
  return 'CartItemDto(menuItem: $menuItem, quantity: $quantity, specialInstructions: $specialInstructions, customizations: $customizations)';
}


}

/// @nodoc
abstract mixin class _$CartItemDtoCopyWith<$Res> implements $CartItemDtoCopyWith<$Res> {
  factory _$CartItemDtoCopyWith(_CartItemDto value, $Res Function(_CartItemDto) _then) = __$CartItemDtoCopyWithImpl;
@override @useResult
$Res call({
 MenuItemDto menuItem, int quantity, String? specialInstructions, List<String>? customizations
});


@override $MenuItemDtoCopyWith<$Res> get menuItem;

}
/// @nodoc
class __$CartItemDtoCopyWithImpl<$Res>
    implements _$CartItemDtoCopyWith<$Res> {
  __$CartItemDtoCopyWithImpl(this._self, this._then);

  final _CartItemDto _self;
  final $Res Function(_CartItemDto) _then;

/// Create a copy of CartItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuItem = null,Object? quantity = null,Object? specialInstructions = freezed,Object? customizations = freezed,}) {
  return _then(_CartItemDto(
menuItem: null == menuItem ? _self.menuItem : menuItem // ignore: cast_nullable_to_non_nullable
as MenuItemDto,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,customizations: freezed == customizations ? _self._customizations : customizations // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of CartItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemDtoCopyWith<$Res> get menuItem {
  
  return $MenuItemDtoCopyWith<$Res>(_self.menuItem, (value) {
    return _then(_self.copyWith(menuItem: value));
  });
}
}


/// @nodoc
mixin _$CartDto {

 String get id; List<CartItemDto> get items; String? get restaurantId; String? get createdAt; String? get updatedAt;
/// Create a copy of CartDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartDtoCopyWith<CartDto> get copyWith => _$CartDtoCopyWithImpl<CartDto>(this as CartDto, _$identity);

  /// Serializes this CartDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(items),restaurantId,createdAt,updatedAt);

@override
String toString() {
  return 'CartDto(id: $id, items: $items, restaurantId: $restaurantId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CartDtoCopyWith<$Res>  {
  factory $CartDtoCopyWith(CartDto value, $Res Function(CartDto) _then) = _$CartDtoCopyWithImpl;
@useResult
$Res call({
 String id, List<CartItemDto> items, String? restaurantId, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$CartDtoCopyWithImpl<$Res>
    implements $CartDtoCopyWith<$Res> {
  _$CartDtoCopyWithImpl(this._self, this._then);

  final CartDto _self;
  final $Res Function(CartDto) _then;

/// Create a copy of CartDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? items = null,Object? restaurantId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemDto>,restaurantId: freezed == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CartDto].
extension CartDtoPatterns on CartDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartDto value)  $default,){
final _that = this;
switch (_that) {
case _CartDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartDto value)?  $default,){
final _that = this;
switch (_that) {
case _CartDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<CartItemDto> items,  String? restaurantId,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartDto() when $default != null:
return $default(_that.id,_that.items,_that.restaurantId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<CartItemDto> items,  String? restaurantId,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CartDto():
return $default(_that.id,_that.items,_that.restaurantId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<CartItemDto> items,  String? restaurantId,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CartDto() when $default != null:
return $default(_that.id,_that.items,_that.restaurantId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartDto extends CartDto {
  const _CartDto({required this.id, required final  List<CartItemDto> items, this.restaurantId, this.createdAt, this.updatedAt}): _items = items,super._();
  factory _CartDto.fromJson(Map<String, dynamic> json) => _$CartDtoFromJson(json);

@override final  String id;
 final  List<CartItemDto> _items;
@override List<CartItemDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? restaurantId;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of CartDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartDtoCopyWith<_CartDto> get copyWith => __$CartDtoCopyWithImpl<_CartDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_items),restaurantId,createdAt,updatedAt);

@override
String toString() {
  return 'CartDto(id: $id, items: $items, restaurantId: $restaurantId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CartDtoCopyWith<$Res> implements $CartDtoCopyWith<$Res> {
  factory _$CartDtoCopyWith(_CartDto value, $Res Function(_CartDto) _then) = __$CartDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, List<CartItemDto> items, String? restaurantId, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$CartDtoCopyWithImpl<$Res>
    implements _$CartDtoCopyWith<$Res> {
  __$CartDtoCopyWithImpl(this._self, this._then);

  final _CartDto _self;
  final $Res Function(_CartDto) _then;

/// Create a copy of CartDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? items = null,Object? restaurantId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CartDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemDto>,restaurantId: freezed == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrderDto {

 String get id; List<CartItemDto> get items; double get subtotal; double get tax; double get total; String get status; String get createdAt; String? get tableNumber; String? get specialInstructions; String? get estimatedTime; String? get completedAt;
/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDtoCopyWith<OrderDto> get copyWith => _$OrderDtoCopyWithImpl<OrderDto>(this as OrderDto, _$identity);

  /// Serializes this OrderDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&(identical(other.estimatedTime, estimatedTime) || other.estimatedTime == estimatedTime)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(items),subtotal,tax,total,status,createdAt,tableNumber,specialInstructions,estimatedTime,completedAt);

@override
String toString() {
  return 'OrderDto(id: $id, items: $items, subtotal: $subtotal, tax: $tax, total: $total, status: $status, createdAt: $createdAt, tableNumber: $tableNumber, specialInstructions: $specialInstructions, estimatedTime: $estimatedTime, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $OrderDtoCopyWith<$Res>  {
  factory $OrderDtoCopyWith(OrderDto value, $Res Function(OrderDto) _then) = _$OrderDtoCopyWithImpl;
@useResult
$Res call({
 String id, List<CartItemDto> items, double subtotal, double tax, double total, String status, String createdAt, String? tableNumber, String? specialInstructions, String? estimatedTime, String? completedAt
});




}
/// @nodoc
class _$OrderDtoCopyWithImpl<$Res>
    implements $OrderDtoCopyWith<$Res> {
  _$OrderDtoCopyWithImpl(this._self, this._then);

  final OrderDto _self;
  final $Res Function(OrderDto) _then;

/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? items = null,Object? subtotal = null,Object? tax = null,Object? total = null,Object? status = null,Object? createdAt = null,Object? tableNumber = freezed,Object? specialInstructions = freezed,Object? estimatedTime = freezed,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemDto>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,tableNumber: freezed == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,estimatedTime: freezed == estimatedTime ? _self.estimatedTime : estimatedTime // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDto].
extension OrderDtoPatterns on OrderDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<CartItemDto> items,  double subtotal,  double tax,  double total,  String status,  String createdAt,  String? tableNumber,  String? specialInstructions,  String? estimatedTime,  String? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
return $default(_that.id,_that.items,_that.subtotal,_that.tax,_that.total,_that.status,_that.createdAt,_that.tableNumber,_that.specialInstructions,_that.estimatedTime,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<CartItemDto> items,  double subtotal,  double tax,  double total,  String status,  String createdAt,  String? tableNumber,  String? specialInstructions,  String? estimatedTime,  String? completedAt)  $default,) {final _that = this;
switch (_that) {
case _OrderDto():
return $default(_that.id,_that.items,_that.subtotal,_that.tax,_that.total,_that.status,_that.createdAt,_that.tableNumber,_that.specialInstructions,_that.estimatedTime,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<CartItemDto> items,  double subtotal,  double tax,  double total,  String status,  String createdAt,  String? tableNumber,  String? specialInstructions,  String? estimatedTime,  String? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
return $default(_that.id,_that.items,_that.subtotal,_that.tax,_that.total,_that.status,_that.createdAt,_that.tableNumber,_that.specialInstructions,_that.estimatedTime,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDto extends OrderDto {
  const _OrderDto({required this.id, required final  List<CartItemDto> items, required this.subtotal, required this.tax, required this.total, required this.status, required this.createdAt, this.tableNumber, this.specialInstructions, this.estimatedTime, this.completedAt}): _items = items,super._();
  factory _OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);

@override final  String id;
 final  List<CartItemDto> _items;
@override List<CartItemDto> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  double subtotal;
@override final  double tax;
@override final  double total;
@override final  String status;
@override final  String createdAt;
@override final  String? tableNumber;
@override final  String? specialInstructions;
@override final  String? estimatedTime;
@override final  String? completedAt;

/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDtoCopyWith<_OrderDto> get copyWith => __$OrderDtoCopyWithImpl<_OrderDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&(identical(other.estimatedTime, estimatedTime) || other.estimatedTime == estimatedTime)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_items),subtotal,tax,total,status,createdAt,tableNumber,specialInstructions,estimatedTime,completedAt);

@override
String toString() {
  return 'OrderDto(id: $id, items: $items, subtotal: $subtotal, tax: $tax, total: $total, status: $status, createdAt: $createdAt, tableNumber: $tableNumber, specialInstructions: $specialInstructions, estimatedTime: $estimatedTime, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderDtoCopyWith<$Res> implements $OrderDtoCopyWith<$Res> {
  factory _$OrderDtoCopyWith(_OrderDto value, $Res Function(_OrderDto) _then) = __$OrderDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, List<CartItemDto> items, double subtotal, double tax, double total, String status, String createdAt, String? tableNumber, String? specialInstructions, String? estimatedTime, String? completedAt
});




}
/// @nodoc
class __$OrderDtoCopyWithImpl<$Res>
    implements _$OrderDtoCopyWith<$Res> {
  __$OrderDtoCopyWithImpl(this._self, this._then);

  final _OrderDto _self;
  final $Res Function(_OrderDto) _then;

/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? items = null,Object? subtotal = null,Object? tax = null,Object? total = null,Object? status = null,Object? createdAt = null,Object? tableNumber = freezed,Object? specialInstructions = freezed,Object? estimatedTime = freezed,Object? completedAt = freezed,}) {
  return _then(_OrderDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItemDto>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,tableNumber: freezed == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,estimatedTime: freezed == estimatedTime ? _self.estimatedTime : estimatedTime // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

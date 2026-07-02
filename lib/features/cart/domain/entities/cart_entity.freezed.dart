// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartItem {

 MenuItem get menuItem; int get quantity; String? get specialInstructions; List<String>? get customizations;
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemCopyWith<CartItem> get copyWith => _$CartItemCopyWithImpl<CartItem>(this as CartItem, _$identity);

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItem&&(identical(other.menuItem, menuItem) || other.menuItem == menuItem)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&const DeepCollectionEquality().equals(other.customizations, customizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItem,quantity,specialInstructions,const DeepCollectionEquality().hash(customizations));

@override
String toString() {
  return 'CartItem(menuItem: $menuItem, quantity: $quantity, specialInstructions: $specialInstructions, customizations: $customizations)';
}


}

/// @nodoc
abstract mixin class $CartItemCopyWith<$Res>  {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) _then) = _$CartItemCopyWithImpl;
@useResult
$Res call({
 MenuItem menuItem, int quantity, String? specialInstructions, List<String>? customizations
});


$MenuItemCopyWith<$Res> get menuItem;

}
/// @nodoc
class _$CartItemCopyWithImpl<$Res>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._self, this._then);

  final CartItem _self;
  final $Res Function(CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuItem = null,Object? quantity = null,Object? specialInstructions = freezed,Object? customizations = freezed,}) {
  return _then(_self.copyWith(
menuItem: null == menuItem ? _self.menuItem : menuItem // ignore: cast_nullable_to_non_nullable
as MenuItem,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,customizations: freezed == customizations ? _self.customizations : customizations // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemCopyWith<$Res> get menuItem {
  
  return $MenuItemCopyWith<$Res>(_self.menuItem, (value) {
    return _then(_self.copyWith(menuItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartItem].
extension CartItemPatterns on CartItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItem value)  $default,){
final _that = this;
switch (_that) {
case _CartItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItem value)?  $default,){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MenuItem menuItem,  int quantity,  String? specialInstructions,  List<String>? customizations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MenuItem menuItem,  int quantity,  String? specialInstructions,  List<String>? customizations)  $default,) {final _that = this;
switch (_that) {
case _CartItem():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MenuItem menuItem,  int quantity,  String? specialInstructions,  List<String>? customizations)?  $default,) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.menuItem,_that.quantity,_that.specialInstructions,_that.customizations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartItem extends CartItem {
  const _CartItem({required this.menuItem, required this.quantity, this.specialInstructions, final  List<String>? customizations}): _customizations = customizations,super._();
  factory _CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

@override final  MenuItem menuItem;
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


/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemCopyWith<_CartItem> get copyWith => __$CartItemCopyWithImpl<_CartItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItem&&(identical(other.menuItem, menuItem) || other.menuItem == menuItem)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&const DeepCollectionEquality().equals(other._customizations, _customizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,menuItem,quantity,specialInstructions,const DeepCollectionEquality().hash(_customizations));

@override
String toString() {
  return 'CartItem(menuItem: $menuItem, quantity: $quantity, specialInstructions: $specialInstructions, customizations: $customizations)';
}


}

/// @nodoc
abstract mixin class _$CartItemCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$CartItemCopyWith(_CartItem value, $Res Function(_CartItem) _then) = __$CartItemCopyWithImpl;
@override @useResult
$Res call({
 MenuItem menuItem, int quantity, String? specialInstructions, List<String>? customizations
});


@override $MenuItemCopyWith<$Res> get menuItem;

}
/// @nodoc
class __$CartItemCopyWithImpl<$Res>
    implements _$CartItemCopyWith<$Res> {
  __$CartItemCopyWithImpl(this._self, this._then);

  final _CartItem _self;
  final $Res Function(_CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuItem = null,Object? quantity = null,Object? specialInstructions = freezed,Object? customizations = freezed,}) {
  return _then(_CartItem(
menuItem: null == menuItem ? _self.menuItem : menuItem // ignore: cast_nullable_to_non_nullable
as MenuItem,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,customizations: freezed == customizations ? _self._customizations : customizations // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MenuItemCopyWith<$Res> get menuItem {
  
  return $MenuItemCopyWith<$Res>(_self.menuItem, (value) {
    return _then(_self.copyWith(menuItem: value));
  });
}
}


/// @nodoc
mixin _$Cart {

 String get id; List<CartItem> get items; String? get restaurantId; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartCopyWith<Cart> get copyWith => _$CartCopyWithImpl<Cart>(this as Cart, _$identity);

  /// Serializes this Cart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cart&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(items),restaurantId,createdAt,updatedAt);

@override
String toString() {
  return 'Cart(id: $id, items: $items, restaurantId: $restaurantId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CartCopyWith<$Res>  {
  factory $CartCopyWith(Cart value, $Res Function(Cart) _then) = _$CartCopyWithImpl;
@useResult
$Res call({
 String id, List<CartItem> items, String? restaurantId, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$CartCopyWithImpl<$Res>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._self, this._then);

  final Cart _self;
  final $Res Function(Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? items = null,Object? restaurantId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,restaurantId: freezed == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Cart].
extension CartPatterns on Cart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cart value)  $default,){
final _that = this;
switch (_that) {
case _Cart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cart value)?  $default,){
final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<CartItem> items,  String? restaurantId,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<CartItem> items,  String? restaurantId,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Cart():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<CartItem> items,  String? restaurantId,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.id,_that.items,_that.restaurantId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cart extends Cart {
  const _Cart({required this.id, required final  List<CartItem> items, this.restaurantId, this.createdAt, this.updatedAt}): _items = items,super._();
  factory _Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

@override final  String id;
 final  List<CartItem> _items;
@override List<CartItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? restaurantId;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartCopyWith<_Cart> get copyWith => __$CartCopyWithImpl<_Cart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cart&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_items),restaurantId,createdAt,updatedAt);

@override
String toString() {
  return 'Cart(id: $id, items: $items, restaurantId: $restaurantId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartCopyWith(_Cart value, $Res Function(_Cart) _then) = __$CartCopyWithImpl;
@override @useResult
$Res call({
 String id, List<CartItem> items, String? restaurantId, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$CartCopyWithImpl<$Res>
    implements _$CartCopyWith<$Res> {
  __$CartCopyWithImpl(this._self, this._then);

  final _Cart _self;
  final $Res Function(_Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? items = null,Object? restaurantId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Cart(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,restaurantId: freezed == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Order {

 String get id; List<CartItem> get items; double get subtotal; double get tax; double get total; OrderStatus get status; DateTime get createdAt; String? get tableNumber; String? get specialInstructions; String? get estimatedTime;// e.g., "25-30 mins"
 DateTime? get completedAt;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&(identical(other.estimatedTime, estimatedTime) || other.estimatedTime == estimatedTime)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(items),subtotal,tax,total,status,createdAt,tableNumber,specialInstructions,estimatedTime,completedAt);

@override
String toString() {
  return 'Order(id: $id, items: $items, subtotal: $subtotal, tax: $tax, total: $total, status: $status, createdAt: $createdAt, tableNumber: $tableNumber, specialInstructions: $specialInstructions, estimatedTime: $estimatedTime, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String id, List<CartItem> items, double subtotal, double tax, double total, OrderStatus status, DateTime createdAt, String? tableNumber, String? specialInstructions, String? estimatedTime, DateTime? completedAt
});




}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? items = null,Object? subtotal = null,Object? tax = null,Object? total = null,Object? status = null,Object? createdAt = null,Object? tableNumber = freezed,Object? specialInstructions = freezed,Object? estimatedTime = freezed,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,tableNumber: freezed == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,estimatedTime: freezed == estimatedTime ? _self.estimatedTime : estimatedTime // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<CartItem> items,  double subtotal,  double tax,  double total,  OrderStatus status,  DateTime createdAt,  String? tableNumber,  String? specialInstructions,  String? estimatedTime,  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<CartItem> items,  double subtotal,  double tax,  double total,  OrderStatus status,  DateTime createdAt,  String? tableNumber,  String? specialInstructions,  String? estimatedTime,  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<CartItem> items,  double subtotal,  double tax,  double total,  OrderStatus status,  DateTime createdAt,  String? tableNumber,  String? specialInstructions,  String? estimatedTime,  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.items,_that.subtotal,_that.tax,_that.total,_that.status,_that.createdAt,_that.tableNumber,_that.specialInstructions,_that.estimatedTime,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order extends Order {
  const _Order({required this.id, required final  List<CartItem> items, required this.subtotal, required this.tax, required this.total, required this.status, required this.createdAt, this.tableNumber, this.specialInstructions, this.estimatedTime, this.completedAt}): _items = items,super._();
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  String id;
 final  List<CartItem> _items;
@override List<CartItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  double subtotal;
@override final  double tax;
@override final  double total;
@override final  OrderStatus status;
@override final  DateTime createdAt;
@override final  String? tableNumber;
@override final  String? specialInstructions;
@override final  String? estimatedTime;
// e.g., "25-30 mins"
@override final  DateTime? completedAt;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.total, total) || other.total == total)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&(identical(other.estimatedTime, estimatedTime) || other.estimatedTime == estimatedTime)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_items),subtotal,tax,total,status,createdAt,tableNumber,specialInstructions,estimatedTime,completedAt);

@override
String toString() {
  return 'Order(id: $id, items: $items, subtotal: $subtotal, tax: $tax, total: $total, status: $status, createdAt: $createdAt, tableNumber: $tableNumber, specialInstructions: $specialInstructions, estimatedTime: $estimatedTime, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String id, List<CartItem> items, double subtotal, double tax, double total, OrderStatus status, DateTime createdAt, String? tableNumber, String? specialInstructions, String? estimatedTime, DateTime? completedAt
});




}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? items = null,Object? subtotal = null,Object? tax = null,Object? total = null,Object? status = null,Object? createdAt = null,Object? tableNumber = freezed,Object? specialInstructions = freezed,Object? estimatedTime = freezed,Object? completedAt = freezed,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,tableNumber: freezed == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,estimatedTime: freezed == estimatedTime ? _self.estimatedTime : estimatedTime // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuItem {

 String get id; String get name; String get description; MenuCategory get category; double get price; bool get available; String? get imageUrl; String? get notes; int? get preparationTime;// in minutes
 List<String>? get allergens; bool? get isVegetarian; bool? get isSpicy; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemCopyWith<MenuItem> get copyWith => _$MenuItemCopyWithImpl<MenuItem>(this as MenuItem, _$identity);

  /// Serializes this MenuItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.available, available) || other.available == available)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.preparationTime, preparationTime) || other.preparationTime == preparationTime)&&const DeepCollectionEquality().equals(other.allergens, allergens)&&(identical(other.isVegetarian, isVegetarian) || other.isVegetarian == isVegetarian)&&(identical(other.isSpicy, isSpicy) || other.isSpicy == isSpicy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,category,price,available,imageUrl,notes,preparationTime,const DeepCollectionEquality().hash(allergens),isVegetarian,isSpicy,createdAt,updatedAt);

@override
String toString() {
  return 'MenuItem(id: $id, name: $name, description: $description, category: $category, price: $price, available: $available, imageUrl: $imageUrl, notes: $notes, preparationTime: $preparationTime, allergens: $allergens, isVegetarian: $isVegetarian, isSpicy: $isSpicy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MenuItemCopyWith<$Res>  {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) _then) = _$MenuItemCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, MenuCategory category, double price, bool available, String? imageUrl, String? notes, int? preparationTime, List<String>? allergens, bool? isVegetarian, bool? isSpicy, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$MenuItemCopyWithImpl<$Res>
    implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._self, this._then);

  final MenuItem _self;
  final $Res Function(MenuItem) _then;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? category = null,Object? price = null,Object? available = null,Object? imageUrl = freezed,Object? notes = freezed,Object? preparationTime = freezed,Object? allergens = freezed,Object? isVegetarian = freezed,Object? isSpicy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as MenuCategory,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,preparationTime: freezed == preparationTime ? _self.preparationTime : preparationTime // ignore: cast_nullable_to_non_nullable
as int?,allergens: freezed == allergens ? _self.allergens : allergens // ignore: cast_nullable_to_non_nullable
as List<String>?,isVegetarian: freezed == isVegetarian ? _self.isVegetarian : isVegetarian // ignore: cast_nullable_to_non_nullable
as bool?,isSpicy: freezed == isSpicy ? _self.isSpicy : isSpicy // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuItem].
extension MenuItemPatterns on MenuItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItem value)  $default,){
final _that = this;
switch (_that) {
case _MenuItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItem value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  MenuCategory category,  double price,  bool available,  String? imageUrl,  String? notes,  int? preparationTime,  List<String>? allergens,  bool? isVegetarian,  bool? isSpicy,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  MenuCategory category,  double price,  bool available,  String? imageUrl,  String? notes,  int? preparationTime,  List<String>? allergens,  bool? isVegetarian,  bool? isSpicy,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MenuItem():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  MenuCategory category,  double price,  bool available,  String? imageUrl,  String? notes,  int? preparationTime,  List<String>? allergens,  bool? isVegetarian,  bool? isSpicy,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.category,_that.price,_that.available,_that.imageUrl,_that.notes,_that.preparationTime,_that.allergens,_that.isVegetarian,_that.isSpicy,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItem extends MenuItem {
  const _MenuItem({required this.id, required this.name, required this.description, required this.category, required this.price, required this.available, this.imageUrl, this.notes, this.preparationTime, final  List<String>? allergens, this.isVegetarian, this.isSpicy, this.createdAt, this.updatedAt}): _allergens = allergens,super._();
  factory _MenuItem.fromJson(Map<String, dynamic> json) => _$MenuItemFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  MenuCategory category;
@override final  double price;
@override final  bool available;
@override final  String? imageUrl;
@override final  String? notes;
@override final  int? preparationTime;
// in minutes
 final  List<String>? _allergens;
// in minutes
@override List<String>? get allergens {
  final value = _allergens;
  if (value == null) return null;
  if (_allergens is EqualUnmodifiableListView) return _allergens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? isVegetarian;
@override final  bool? isSpicy;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemCopyWith<_MenuItem> get copyWith => __$MenuItemCopyWithImpl<_MenuItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.available, available) || other.available == available)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.preparationTime, preparationTime) || other.preparationTime == preparationTime)&&const DeepCollectionEquality().equals(other._allergens, _allergens)&&(identical(other.isVegetarian, isVegetarian) || other.isVegetarian == isVegetarian)&&(identical(other.isSpicy, isSpicy) || other.isSpicy == isSpicy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,category,price,available,imageUrl,notes,preparationTime,const DeepCollectionEquality().hash(_allergens),isVegetarian,isSpicy,createdAt,updatedAt);

@override
String toString() {
  return 'MenuItem(id: $id, name: $name, description: $description, category: $category, price: $price, available: $available, imageUrl: $imageUrl, notes: $notes, preparationTime: $preparationTime, allergens: $allergens, isVegetarian: $isVegetarian, isSpicy: $isSpicy, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MenuItemCopyWith<$Res> implements $MenuItemCopyWith<$Res> {
  factory _$MenuItemCopyWith(_MenuItem value, $Res Function(_MenuItem) _then) = __$MenuItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, MenuCategory category, double price, bool available, String? imageUrl, String? notes, int? preparationTime, List<String>? allergens, bool? isVegetarian, bool? isSpicy, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$MenuItemCopyWithImpl<$Res>
    implements _$MenuItemCopyWith<$Res> {
  __$MenuItemCopyWithImpl(this._self, this._then);

  final _MenuItem _self;
  final $Res Function(_MenuItem) _then;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? category = null,Object? price = null,Object? available = null,Object? imageUrl = freezed,Object? notes = freezed,Object? preparationTime = freezed,Object? allergens = freezed,Object? isVegetarian = freezed,Object? isSpicy = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_MenuItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as MenuCategory,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,preparationTime: freezed == preparationTime ? _self.preparationTime : preparationTime // ignore: cast_nullable_to_non_nullable
as int?,allergens: freezed == allergens ? _self._allergens : allergens // ignore: cast_nullable_to_non_nullable
as List<String>?,isVegetarian: freezed == isVegetarian ? _self.isVegetarian : isVegetarian // ignore: cast_nullable_to_non_nullable
as bool?,isSpicy: freezed == isSpicy ? _self.isSpicy : isSpicy // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$MenuSection {

 MenuCategory get category; List<MenuItem> get items;
/// Create a copy of MenuSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuSectionCopyWith<MenuSection> get copyWith => _$MenuSectionCopyWithImpl<MenuSection>(this as MenuSection, _$identity);

  /// Serializes this MenuSection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuSection&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'MenuSection(category: $category, items: $items)';
}


}

/// @nodoc
abstract mixin class $MenuSectionCopyWith<$Res>  {
  factory $MenuSectionCopyWith(MenuSection value, $Res Function(MenuSection) _then) = _$MenuSectionCopyWithImpl;
@useResult
$Res call({
 MenuCategory category, List<MenuItem> items
});




}
/// @nodoc
class _$MenuSectionCopyWithImpl<$Res>
    implements $MenuSectionCopyWith<$Res> {
  _$MenuSectionCopyWithImpl(this._self, this._then);

  final MenuSection _self;
  final $Res Function(MenuSection) _then;

/// Create a copy of MenuSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? items = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as MenuCategory,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuSection].
extension MenuSectionPatterns on MenuSection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuSection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuSection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuSection value)  $default,){
final _that = this;
switch (_that) {
case _MenuSection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuSection value)?  $default,){
final _that = this;
switch (_that) {
case _MenuSection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MenuCategory category,  List<MenuItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuSection() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MenuCategory category,  List<MenuItem> items)  $default,) {final _that = this;
switch (_that) {
case _MenuSection():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MenuCategory category,  List<MenuItem> items)?  $default,) {final _that = this;
switch (_that) {
case _MenuSection() when $default != null:
return $default(_that.category,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuSection extends MenuSection {
  const _MenuSection({required this.category, required final  List<MenuItem> items}): _items = items,super._();
  factory _MenuSection.fromJson(Map<String, dynamic> json) => _$MenuSectionFromJson(json);

@override final  MenuCategory category;
 final  List<MenuItem> _items;
@override List<MenuItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of MenuSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuSectionCopyWith<_MenuSection> get copyWith => __$MenuSectionCopyWithImpl<_MenuSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuSectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuSection&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MenuSection(category: $category, items: $items)';
}


}

/// @nodoc
abstract mixin class _$MenuSectionCopyWith<$Res> implements $MenuSectionCopyWith<$Res> {
  factory _$MenuSectionCopyWith(_MenuSection value, $Res Function(_MenuSection) _then) = __$MenuSectionCopyWithImpl;
@override @useResult
$Res call({
 MenuCategory category, List<MenuItem> items
});




}
/// @nodoc
class __$MenuSectionCopyWithImpl<$Res>
    implements _$MenuSectionCopyWith<$Res> {
  __$MenuSectionCopyWithImpl(this._self, this._then);

  final _MenuSection _self;
  final $Res Function(_MenuSection) _then;

/// Create a copy of MenuSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? items = null,}) {
  return _then(_MenuSection(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as MenuCategory,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,
  ));
}


}


/// @nodoc
mixin _$Menu {

 String get id; String get restaurantId; List<MenuSection> get sections; DateTime get lastUpdated; String? get version;
/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuCopyWith<Menu> get copyWith => _$MenuCopyWithImpl<Menu>(this as Menu, _$identity);

  /// Serializes this Menu to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Menu&&(identical(other.id, id) || other.id == id)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&const DeepCollectionEquality().equals(other.sections, sections)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,restaurantId,const DeepCollectionEquality().hash(sections),lastUpdated,version);

@override
String toString() {
  return 'Menu(id: $id, restaurantId: $restaurantId, sections: $sections, lastUpdated: $lastUpdated, version: $version)';
}


}

/// @nodoc
abstract mixin class $MenuCopyWith<$Res>  {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) _then) = _$MenuCopyWithImpl;
@useResult
$Res call({
 String id, String restaurantId, List<MenuSection> sections, DateTime lastUpdated, String? version
});




}
/// @nodoc
class _$MenuCopyWithImpl<$Res>
    implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._self, this._then);

  final Menu _self;
  final $Res Function(Menu) _then;

/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? restaurantId = null,Object? sections = null,Object? lastUpdated = null,Object? version = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<MenuSection>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Menu].
extension MenuPatterns on Menu {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Menu value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Menu() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Menu value)  $default,){
final _that = this;
switch (_that) {
case _Menu():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Menu value)?  $default,){
final _that = this;
switch (_that) {
case _Menu() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String restaurantId,  List<MenuSection> sections,  DateTime lastUpdated,  String? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Menu() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String restaurantId,  List<MenuSection> sections,  DateTime lastUpdated,  String? version)  $default,) {final _that = this;
switch (_that) {
case _Menu():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String restaurantId,  List<MenuSection> sections,  DateTime lastUpdated,  String? version)?  $default,) {final _that = this;
switch (_that) {
case _Menu() when $default != null:
return $default(_that.id,_that.restaurantId,_that.sections,_that.lastUpdated,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Menu extends Menu {
  const _Menu({required this.id, required this.restaurantId, required final  List<MenuSection> sections, required this.lastUpdated, this.version}): _sections = sections,super._();
  factory _Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

@override final  String id;
@override final  String restaurantId;
 final  List<MenuSection> _sections;
@override List<MenuSection> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}

@override final  DateTime lastUpdated;
@override final  String? version;

/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuCopyWith<_Menu> get copyWith => __$MenuCopyWithImpl<_Menu>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Menu&&(identical(other.id, id) || other.id == id)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&const DeepCollectionEquality().equals(other._sections, _sections)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,restaurantId,const DeepCollectionEquality().hash(_sections),lastUpdated,version);

@override
String toString() {
  return 'Menu(id: $id, restaurantId: $restaurantId, sections: $sections, lastUpdated: $lastUpdated, version: $version)';
}


}

/// @nodoc
abstract mixin class _$MenuCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$MenuCopyWith(_Menu value, $Res Function(_Menu) _then) = __$MenuCopyWithImpl;
@override @useResult
$Res call({
 String id, String restaurantId, List<MenuSection> sections, DateTime lastUpdated, String? version
});




}
/// @nodoc
class __$MenuCopyWithImpl<$Res>
    implements _$MenuCopyWith<$Res> {
  __$MenuCopyWithImpl(this._self, this._then);

  final _Menu _self;
  final $Res Function(_Menu) _then;

/// Create a copy of Menu
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? restaurantId = null,Object? sections = null,Object? lastUpdated = null,Object? version = freezed,}) {
  return _then(_Menu(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<MenuSection>,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

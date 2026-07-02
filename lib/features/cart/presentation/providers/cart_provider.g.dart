// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Current cart provider

@ProviderFor(cart)
final cartProvider = CartProvider._();

/// Current cart provider

final class CartProvider
    extends $FunctionalProvider<AsyncValue<Cart>, Cart, FutureOr<Cart>>
    with $FutureModifier<Cart>, $FutureProvider<Cart> {
  /// Current cart provider
  CartProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartHash();

  @$internal
  @override
  $FutureProviderElement<Cart> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Cart> create(Ref ref) {
    return cart(ref);
  }
}

String _$cartHash() => r'c2724e04166444cf5e9274c76eda047835c9a0a8';

/// Order history provider

@ProviderFor(orderHistory)
final orderHistoryProvider = OrderHistoryProvider._();

/// Order history provider

final class OrderHistoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Order>>,
          List<Order>,
          FutureOr<List<Order>>
        >
    with $FutureModifier<List<Order>>, $FutureProvider<List<Order>> {
  /// Order history provider
  OrderHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderHistoryHash();

  @$internal
  @override
  $FutureProviderElement<List<Order>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Order>> create(Ref ref) {
    return orderHistory(ref);
  }
}

String _$orderHistoryHash() => r'19f387aebfd772b185d84c7d6e275f973ec7a6de';

/// Specific order provider

@ProviderFor(orderById)
final orderByIdProvider = OrderByIdFamily._();

/// Specific order provider

final class OrderByIdProvider
    extends $FunctionalProvider<AsyncValue<Order>, Order, FutureOr<Order>>
    with $FutureModifier<Order>, $FutureProvider<Order> {
  /// Specific order provider
  OrderByIdProvider._({
    required OrderByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'orderByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$orderByIdHash();

  @override
  String toString() {
    return r'orderByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Order> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Order> create(Ref ref) {
    final argument = this.argument as String;
    return orderById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$orderByIdHash() => r'71be14250278de113f032230ea6f1a89f72fd80d';

/// Specific order provider

final class OrderByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Order>, String> {
  OrderByIdFamily._()
    : super(
        retry: null,
        name: r'orderByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Specific order provider

  OrderByIdProvider call(String orderId) =>
      OrderByIdProvider._(argument: orderId, from: this);

  @override
  String toString() => r'orderByIdProvider';
}

/// Notifier for managing cart operations

@ProviderFor(CartNotifier)
final cartProvider = CartNotifierProvider._();

/// Notifier for managing cart operations
final class CartNotifierProvider
    extends $AsyncNotifierProvider<CartNotifier, Cart> {
  /// Notifier for managing cart operations
  CartNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartNotifierHash();

  @$internal
  @override
  CartNotifier create() => CartNotifier();
}

String _$cartNotifierHash() => r'96daaf7bfed25a785b03d3610cb6db74b86f89d5';

/// Notifier for managing cart operations

abstract class _$CartNotifier extends $AsyncNotifier<Cart> {
  FutureOr<Cart> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Cart>, Cart>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Cart>, Cart>,
              AsyncValue<Cart>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Checkout state notifier

@ProviderFor(CheckoutNotifier)
final checkoutProvider = CheckoutNotifierProvider._();

/// Checkout state notifier
final class CheckoutNotifierProvider
    extends $NotifierProvider<CheckoutNotifier, AsyncValue<Order>> {
  /// Checkout state notifier
  CheckoutNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkoutProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkoutNotifierHash();

  @$internal
  @override
  CheckoutNotifier create() => CheckoutNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Order> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Order>>(value),
    );
  }
}

String _$checkoutNotifierHash() => r'dddb5a84944f1b255d11a2471a826446f9e00d60';

/// Checkout state notifier

abstract class _$CheckoutNotifier extends $Notifier<AsyncValue<Order>> {
  AsyncValue<Order> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Order>, AsyncValue<Order>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Order>, AsyncValue<Order>>,
              AsyncValue<Order>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Table number input state

@ProviderFor(TableNumberInput)
final tableNumberInputProvider = TableNumberInputProvider._();

/// Table number input state
final class TableNumberInputProvider
    extends $NotifierProvider<TableNumberInput, String> {
  /// Table number input state
  TableNumberInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tableNumberInputProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tableNumberInputHash();

  @$internal
  @override
  TableNumberInput create() => TableNumberInput();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$tableNumberInputHash() => r'df6bfe1f17b545001e875ed65bebc3a69a65ca4c';

/// Table number input state

abstract class _$TableNumberInput extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Special instructions input state

@ProviderFor(SpecialInstructionsInput)
final specialInstructionsInputProvider = SpecialInstructionsInputProvider._();

/// Special instructions input state
final class SpecialInstructionsInputProvider
    extends $NotifierProvider<SpecialInstructionsInput, String> {
  /// Special instructions input state
  SpecialInstructionsInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'specialInstructionsInputProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$specialInstructionsInputHash();

  @$internal
  @override
  SpecialInstructionsInput create() => SpecialInstructionsInput();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$specialInstructionsInputHash() =>
    r'6568de17e2f6460e9fd9ff1e48c7b44acf0977e0';

/// Special instructions input state

abstract class _$SpecialInstructionsInput extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(OrderHistoryFilter)
final orderHistoryFilterProvider = OrderHistoryFilterProvider._();

final class OrderHistoryFilterProvider
    extends $NotifierProvider<OrderHistoryFilter, OrderFilter> {
  OrderHistoryFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderHistoryFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderHistoryFilterHash();

  @$internal
  @override
  OrderHistoryFilter create() => OrderHistoryFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrderFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrderFilter>(value),
    );
  }
}

String _$orderHistoryFilterHash() =>
    r'3224e92795acb9aa061b9009dac69885612c2dcb';

abstract class _$OrderHistoryFilter extends $Notifier<OrderFilter> {
  OrderFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<OrderFilter, OrderFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OrderFilter, OrderFilter>,
              OrderFilter,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Filtered order history

@ProviderFor(filteredOrderHistory)
final filteredOrderHistoryProvider = FilteredOrderHistoryProvider._();

/// Filtered order history

final class FilteredOrderHistoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Order>>,
          List<Order>,
          FutureOr<List<Order>>
        >
    with $FutureModifier<List<Order>>, $FutureProvider<List<Order>> {
  /// Filtered order history
  FilteredOrderHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredOrderHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredOrderHistoryHash();

  @$internal
  @override
  $FutureProviderElement<List<Order>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Order>> create(Ref ref) {
    return filteredOrderHistory(ref);
  }
}

String _$filteredOrderHistoryHash() =>
    r'3ecf4ba2e3bd5caac0c2d889b7abafbb102bafb0';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/extensions/context_extensions.dart';
import '../../domain/entities/cart_entity.dart';
import '../providers/cart_provider.dart';
import '../widgets/order_card_widget.dart';

/// Order history screen - displays past orders
class OrderHistoryScreen extends ConsumerWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsync = ref.watch(filteredOrderHistoryProvider);
    final filter = ref.watch(orderHistoryFilterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Filter chips
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: const Text('All'),
                      selected: filter == OrderFilter.all,
                      onSelected: (_) =>
                          ref
                              .read(orderHistoryFilterProvider.notifier)
                              .setFilter(OrderFilter.all),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: const Text('Pending'),
                      selected: filter == OrderFilter.pending,
                      onSelected: (_) =>
                          ref
                              .read(orderHistoryFilterProvider.notifier)
                              .setFilter(OrderFilter.pending),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: const Text('Completed'),
                      selected: filter == OrderFilter.completed,
                      onSelected: (_) =>
                          ref
                              .read(orderHistoryFilterProvider.notifier)
                              .setFilter(OrderFilter.completed),
                    ),
                  ),
                  FilterChip(
                    label: const Text('Cancelled'),
                    selected: filter == OrderFilter.cancelled,
                    onSelected: (_) =>
                        ref
                            .read(orderHistoryFilterProvider.notifier)
                            .setFilter(OrderFilter.cancelled),
                  ),
                ],
              ),
            ),
          ),
          // Orders list
          Expanded(
            child: ordersAsync.when(
              data: (orders) {
                if (orders.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long,
                          size: 100,
                          color:
                              context.colorScheme.outline.withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No orders yet',
                          style: context.textTheme.titleMedium?.copyWith(
                            color:
                                context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: OrderCardWidget(order: orders[index]),
                    );
                  },
                );
              },
              loading: () => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(
                      'Loading orders...',
                      style: context.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 80,
                      color: context.colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Failed to load orders',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colorScheme.error,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                      onPressed: () {
                        ref.invalidate(orderHistoryProvider);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

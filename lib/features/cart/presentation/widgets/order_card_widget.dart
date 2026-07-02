import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/extensions/context_extensions.dart';
import '../../domain/entities/cart_entity.dart';

/// Order card widget displaying order summary
class OrderCardWidget extends StatelessWidget {
  final Order order;

  const OrderCardWidget({
    required this.order,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy • HH:mm');
    final createdDate = dateFormat.format(order.createdAt);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order #${order.id.substring(0, 8).toUpperCase()}',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      createdDate,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                // Status badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(context, order.status),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${order.statusIcon} ${order.statusDisplay}',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: _getStatusTextColor(context, order.status),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Divider(
              color: context.colorScheme.outlineVariant,
            ),
            const SizedBox(height: 12),
            // Items count
            Text(
              '${order.items.length} item${order.items.length > 1 ? 's' : ''} • ${order.items.fold<int>(0, (sum, item) => sum + 1)} total items',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            // Price breakdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal:',
                  style: context.textTheme.bodySmall,
                ),
                Text(
                  order.displaySubtotal,
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tax:',
                  style: context.textTheme.bodySmall,
                ),
                Text(
                  order.displayTax,
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.primary,
                  ),
                ),
                Text(
                  order.displayTotal,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.primary,
                  ),
                ),
              ],
            ),
            // Additional info
            if (order.tableNumber != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  'Table ${order.tableNumber}',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            if (order.specialInstructions != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Note: ${order.specialInstructions}',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(BuildContext context, OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return context.colorScheme.tertiaryContainer;
      case OrderStatus.confirmed:
        return context.colorScheme.primaryContainer;
      case OrderStatus.preparing:
        return context.colorScheme.secondaryContainer;
      case OrderStatus.ready:
        return context.colorScheme.tertiaryContainer;
      case OrderStatus.completed:
        return Colors.green.withOpacity(0.2);
      case OrderStatus.cancelled:
        return context.colorScheme.errorContainer;
    }
  }

  Color _getStatusTextColor(BuildContext context, OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return context.colorScheme.onTertiaryContainer;
      case OrderStatus.confirmed:
        return context.colorScheme.onPrimaryContainer;
      case OrderStatus.preparing:
        return context.colorScheme.onSecondaryContainer;
      case OrderStatus.ready:
        return context.colorScheme.onTertiaryContainer;
      case OrderStatus.completed:
        return Colors.green.shade700;
      case OrderStatus.cancelled:
        return context.colorScheme.onErrorContainer;
    }
  }
}

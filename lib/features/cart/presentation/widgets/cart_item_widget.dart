import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/extensions/context_extensions.dart';
import '../../domain/entities/cart_entity.dart';
import '../providers/cart_provider.dart';

/// Cart item widget displaying a single cart item
class CartItemWidget extends ConsumerWidget {
  final CartItem item;

  const CartItemWidget({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Item image or placeholder
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(8),
              ),
              child: item.menuItem.imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item.menuItem.imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) {
                          return Icon(
                            Icons.restaurant_menu,
                            color:
                                context.colorScheme.onSurfaceVariant,
                          );
                        },
                      ),
                    )
                  : Icon(
                      Icons.restaurant_menu,
                      color: context.colorScheme.onSurfaceVariant,
                    ),
            ),
            const SizedBox(width: 16),
            // Item details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    item.menuItem.name,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Price
                  Text(
                    item.menuItem.displayPrice,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Total for this item
                  Text(
                    'Total: ${item.displayTotal}',
                    style: context.textTheme.titleSmall?.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Special instructions if any
                  if (item.specialInstructions != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Note: ${item.specialInstructions}',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colorScheme.primary,
                          fontStyle: FontStyle.italic,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Quantity controls
            Column(
              children: [
                // Quantity buttons
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      // Decrement
                      SizedBox(
                        width: 36,
                        height: 36,
                        child: IconButton(
                          icon: const Icon(Icons.remove),
                          iconSize: 16,
                          onPressed: () => ref
                              .read(cartNotifierProvider.notifier)
                              .decrement(item.menuItem.id),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      // Quantity
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          '${item.quantity}',
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Increment
                      SizedBox(
                        width: 36,
                        height: 36,
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          iconSize: 16,
                          onPressed: () => ref
                              .read(cartNotifierProvider.notifier)
                              .increment(item.menuItem.id),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Remove button
                SizedBox(
                  height: 32,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.delete, size: 16),
                    label: const Text('Remove'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colorScheme.error,
                      foregroundColor: context.colorScheme.onError,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    onPressed: () => ref
                        .read(cartNotifierProvider.notifier)
                        .removeItem(item.menuItem.id),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

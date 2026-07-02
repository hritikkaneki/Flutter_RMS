import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/extensions/context_extensions.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../providers/cart_provider.dart';

/// Checkout bottom sheet widget
class CheckoutBottomSheet extends ConsumerWidget {
  const CheckoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tableInput = ref.watch(tableNumberInputProvider);
    final instructionsInput = ref.watch(specialInstructionsInputProvider);
    final checkoutState = ref.watch(checkoutNotifierProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Text(
              'Order Details',
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            // Table number input
            AppTextField(
              label: 'Table Number',
              hint: 'Enter table number',
              controller: TextEditingController(text: tableInput),
              onChanged: (value) =>
                  ref.read(tableNumberInputProvider.notifier).update(value),
              keyboardType: TextInputType.number,
              prefixIcon: Icons.table_restaurant,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Table number is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Special instructions input
            AppTextField(
              label: 'Special Instructions (Optional)',
              hint: 'e.g., No onions, Extra sauce...',
              controller: TextEditingController(text: instructionsInput),
              onChanged: (value) => ref
                  .read(specialInstructionsInputProvider.notifier)
                  .update(value),
              maxLines: 3,
              prefixIcon: Icons.note,
            ),
            const SizedBox(height: 24),

            // Checkout button
            checkoutState.when(
              data: (order) => AppButton(
                text: 'Place Order',
                onPressed: tableInput.isEmpty
                    ? null
                    : () => _performCheckout(
                          context,
                          ref,
                          tableInput,
                          instructionsInput.isEmpty ? null : instructionsInput,
                        ),
              ),
              loading: () => const AppButton(
                text: 'Processing...',
                isLoading: true,
              ),
              error: (error, stack) => Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: context.colorScheme.errorContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      error.toString(),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppButton(
                    text: 'Try Again',
                    onPressed: tableInput.isEmpty
                        ? null
                        : () => _performCheckout(
                              context,
                              ref,
                              tableInput,
                              instructionsInput.isEmpty
                                  ? null
                                  : instructionsInput,
                            ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Perform checkout
  Future<void> _performCheckout(
    BuildContext context,
    WidgetRef ref,
    String tableNumber,
    String? specialInstructions,
  ) async {
    try {
      final order = await ref.read(checkoutNotifierProvider.notifier).checkout(
            tableNumber: tableNumber,
            specialInstructions: specialInstructions,
          );

      if (!context.mounted) return;

      // Show success dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Order Placed Successfully! 🎉'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Order ID: ${order.id}'),
              const SizedBox(height: 8),
              Text('Table: $tableNumber'),
              const SizedBox(height: 8),
              Text('Total: ${order.totalDisplay}'),
              const SizedBox(height: 8),
              Text('Status: ${order.statusDisplay}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => context.go('/home'),
              child: const Text('Back to Home'),
            ),
            TextButton(
              onPressed: () => context.go('/menu'),
              child: const Text('Continue Shopping'),
            ),
          ],
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      context.showErrorSnackBar('Checkout failed: ${e.toString()}');
    }
  }
}

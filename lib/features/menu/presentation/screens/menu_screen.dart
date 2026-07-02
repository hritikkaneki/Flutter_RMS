import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/extensions/context_extensions.dart';
import '../../domain/entities/menu_entity.dart';
import '../providers/menu_provider.dart';
import '../widgets/menu_category_filter.dart';
import '../widgets/menu_item_card.dart';
import '../widgets/menu_search_bar.dart';

/// Menu screen - displays complete restaurant menu
class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredItems = ref.watch(filteredMenuItemsProvider);
    final selectedCategory = ref.watch(selectedMenuCategoryProvider);
    final viewMode = ref.watch(menuViewModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        elevation: 0,
        actions: [
          // View mode toggle button
          IconButton(
            icon: Icon(
              viewMode == MenuViewMode.grid
                  ? Icons.view_list
                  : Icons.grid_3x3,
            ),
            onPressed: () =>
                ref.read(menuViewModeProvider.notifier).toggleViewMode(),
            tooltip: viewMode == MenuViewMode.grid
                ? 'Switch to list view'
                : 'Switch to grid view',
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          const Padding(
            padding: EdgeInsets.all(16),
            child: MenuSearchBar(),
          ),

          // Category filters
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // "All" button
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: const Text('All'),
                      selected: selectedCategory == null,
                      onSelected: (_) {
                        ref
                            .read(selectedMenuCategoryProvider.notifier)
                            .select(null);
                      },
                    ),
                  ),
                  // Category filter chips
                  ...MenuCategory.values.map(
                    (category) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text(category.displayName),
                        selected: selectedCategory == category,
                        onSelected: (_) {
                          ref
                              .read(selectedMenuCategoryProvider.notifier)
                              .select(category);
                          ref
                              .read(menuSearchQueryProvider.notifier)
                              .clear();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Menu items grid/list
          Expanded(
            child: filteredItems.when(
              data: (items) {
                if (items.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.restaurant_menu,
                          size: 80,
                          color: context.colorScheme.outline.withOpacity(0.5),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No items found',
                          style: context.textTheme.titleMedium?.copyWith(
                            color:
                                context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                if (viewMode == MenuViewMode.grid) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return MenuItemCard(
                        item: items[index],
                      );
                    },
                  );
                } else {
                  // List view
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: MenuItemCard(
                          item: items[index],
                          isCompact: true,
                        ),
                      );
                    },
                  );
                }
              },
              loading: () => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(
                      'Loading menu...',
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
                      'Failed to load menu',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colorScheme.error,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      error.toString(),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                      onPressed: () {
                        ref.invalidate(menuProvider);
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

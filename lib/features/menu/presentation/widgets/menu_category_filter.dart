import 'package:flutter/material.dart';

import '../../domain/entities/menu_entity.dart';

/// Category filter widget for menu
class MenuCategoryFilter extends StatelessWidget {
  final MenuCategory? selectedCategory;
  final ValueChanged<MenuCategory?> onCategorySelected;

  const MenuCategoryFilter({
    required this.selectedCategory,
    required this.onCategorySelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // "All" chip
          FilterChip(
            label: const Text('All'),
            selected: selectedCategory == null,
            onSelected: (_) => onCategorySelected(null),
          ),
          const SizedBox(width: 8),
          // Category chips
          ...MenuCategory.values.map(
            (category) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: Text('${category.icon} ${category.displayName}'),
                selected: selectedCategory == category,
                onSelected: (_) => onCategorySelected(category),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

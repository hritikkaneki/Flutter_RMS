import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/menu_entity.dart';

/// Abstract repository for menu operations
abstract class MenuRepository {
  /// Get complete menu
  Future<Either<Failure, Menu>> getMenu();

  /// Get menu items by category
  Future<Either<Failure, List<MenuItem>>> getItemsByCategory(
    MenuCategory category,
  );

  /// Search menu items
  Future<Either<Failure, List<MenuItem>>> searchItems(String query);

  /// Get vegetarian items
  Future<Either<Failure, List<MenuItem>>> getVegetarianItems();

  /// Get items without allergen
  Future<Either<Failure, List<MenuItem>>> getItemsWithoutAllergen(
    String allergen,
  );

  /// Get menu item by ID
  Future<Either<Failure, MenuItem>> getItemById(String itemId);

  /// Cache menu locally
  Future<Either<Failure, void>> cacheMenu(Menu menu);

  /// Get cached menu
  Future<Either<Failure, Menu?>> getCachedMenu();

  /// Clear cached menu
  Future<Either<Failure, void>> clearCachedMenu();
}

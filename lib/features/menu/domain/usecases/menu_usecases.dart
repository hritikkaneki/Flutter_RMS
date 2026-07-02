import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_management_system/features/menu/data/repositories/menu_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../entities/menu_entity.dart';
import '../repositories/menu_repository.dart';

part 'menu_usecases.g.dart';

/// ============================================================================
/// GetMenuUseCase
/// ============================================================================

class GetMenuUseCase {
  final MenuRepository repository;

  GetMenuUseCase(this.repository);

  Future<Either<Failure, Menu>> call() => repository.getMenu();
}

@riverpod
GetMenuUseCase getMenuUseCase(Ref ref) {
  return GetMenuUseCase(ref.watch(menuRepositoryProvider));
}

/// ============================================================================
/// GetItemsByCategoryUseCase
/// ============================================================================

class GetItemsByCategoryUseCase {
  final MenuRepository repository;

  GetItemsByCategoryUseCase(this.repository);

  Future<Either<Failure, List<MenuItem>>> call(MenuCategory category) =>
      repository.getItemsByCategory(category);
}

@riverpod
GetItemsByCategoryUseCase getItemsByCategoryUseCase(Ref ref) {
  return GetItemsByCategoryUseCase(ref.watch(menuRepositoryProvider));
}

/// ============================================================================
/// SearchMenuItemsUseCase
/// ============================================================================

class SearchMenuItemsUseCase {
  final MenuRepository repository;

  SearchMenuItemsUseCase(this.repository);

  Future<Either<Failure, List<MenuItem>>> call(String query) =>
      repository.searchItems(query);
}

@riverpod
SearchMenuItemsUseCase searchMenuItemsUseCase(Ref ref) {
  return SearchMenuItemsUseCase(ref.watch(menuRepositoryProvider));
}

/// ============================================================================
/// GetVegetarianItemsUseCase
/// ============================================================================

class GetVegetarianItemsUseCase {
  final MenuRepository repository;

  GetVegetarianItemsUseCase(this.repository);

  Future<Either<Failure, List<MenuItem>>> call() =>
      repository.getVegetarianItems();
}

@riverpod
GetVegetarianItemsUseCase getVegetarianItemsUseCase(Ref ref) {
  return GetVegetarianItemsUseCase(ref.watch(menuRepositoryProvider));
}

/// ============================================================================
/// GetItemsWithoutAllergenUseCase
/// ============================================================================

class GetItemsWithoutAllergenUseCase {
  final MenuRepository repository;

  GetItemsWithoutAllergenUseCase(this.repository);

  Future<Either<Failure, List<MenuItem>>> call(String allergen) =>
      repository.getItemsWithoutAllergen(allergen);
}

@riverpod
GetItemsWithoutAllergenUseCase getItemsWithoutAllergenUseCase(Ref ref) {
  return GetItemsWithoutAllergenUseCase(ref.watch(menuRepositoryProvider));
}

/// ============================================================================
/// GetMenuItemByIdUseCase
/// ============================================================================

class GetMenuItemByIdUseCase {
  final MenuRepository repository;

  GetMenuItemByIdUseCase(this.repository);

  Future<Either<Failure, MenuItem>> call(String itemId) =>
      repository.getItemById(itemId);
}

@riverpod
GetMenuItemByIdUseCase getMenuItemByIdUseCase(Ref ref) {
  return GetMenuItemByIdUseCase(ref.watch(menuRepositoryProvider));
}

/// ============================================================================
/// CacheMenuUseCase
/// ============================================================================

class CacheMenuUseCase {
  final MenuRepository repository;

  CacheMenuUseCase(this.repository);

  Future<Either<Failure, void>> call(Menu menu) =>
      repository.cacheMenu(menu);
}

@riverpod
CacheMenuUseCase cacheMenuUseCase(Ref ref) {
  return CacheMenuUseCase(ref.watch(menuRepositoryProvider));
}

/// ============================================================================
/// GetCachedMenuUseCase
/// ============================================================================

class GetCachedMenuUseCase {
  final MenuRepository repository;

  GetCachedMenuUseCase(this.repository);

  Future<Either<Failure, Menu?>> call() => repository.getCachedMenu();
}

@riverpod
GetCachedMenuUseCase getCachedMenuUseCase(Ref ref) {
  return GetCachedMenuUseCase(ref.watch(menuRepositoryProvider));
}

/// ============================================================================
/// ClearCachedMenuUseCase
/// ============================================================================

class ClearCachedMenuUseCase {
  final MenuRepository repository;

  ClearCachedMenuUseCase(this.repository);

  Future<Either<Failure, void>> call() => repository.clearCachedMenu();
}

@riverpod
ClearCachedMenuUseCase clearCachedMenuUseCase(Ref ref) {
  return ClearCachedMenuUseCase(ref.watch(menuRepositoryProvider));
}

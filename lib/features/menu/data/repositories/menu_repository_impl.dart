import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/storage/hive_storage.dart';
import '../../domain/entities/menu_entity.dart';
import '../../domain/repositories/menu_repository.dart';
import '../datasources/menu_remote_datasource.dart';
import '../mappers/menu_mapper.dart';

part 'menu_repository_impl.g.dart';

/// Menu repository provider
@riverpod
MenuRepository menuRepository(Ref ref) {
  return MenuRepositoryImpl(
    ref.watch(menuRemoteDataSourceProvider),
    ref.watch(hiveStorageProvider),
  );
}

/// Implementation of menu repository
class MenuRepositoryImpl implements MenuRepository {
  static const String _menuCacheKey = 'cached_menu';

  final MenuRemoteDataSource _remoteDataSource;
  final HiveStorage _localStorage;

  MenuRepositoryImpl(this._remoteDataSource, this._localStorage);

  @override
  Future<Either<Failure, Menu>> getMenu() async {
    try {
      final dto = await _remoteDataSource.getMenu();
      final menu = MenuMapper.menuDtoToEntity(dto);

      // Cache the menu locally
      await _localStorage.put(_menuCacheKey, menu);

      return Right(menu);
    } on NotFoundException catch (e) {
      return Left(Failure.notFound(e.message));
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return const Left(Failure.network());
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MenuItem>>> getItemsByCategory(
    MenuCategory category,
  ) async {
    try {
      final categoryStr = _mapCategoryToString(category);
      final dtos = await _remoteDataSource.getItemsByCategory(categoryStr);
      final items = dtos.map(MenuMapper.menuItemDtoToEntity).toList();
      return Right(items);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return const Left(Failure.network());
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MenuItem>>> searchItems(String query) async {
    try {
      if (query.isEmpty) {
        return const Right([]);
      }
      final dtos = await _remoteDataSource.searchItems(query);
      final items = dtos.map(MenuMapper.menuItemDtoToEntity).toList();
      return Right(items);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return const Left(Failure.network());
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MenuItem>>> getVegetarianItems() async {
    try {
      final dtos = await _remoteDataSource.getVegetarianItems();
      final items = dtos.map(MenuMapper.menuItemDtoToEntity).toList();
      return Right(items);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return const Left(Failure.network());
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MenuItem>>> getItemsWithoutAllergen(
    String allergen,
  ) async {
    try {
      final dtos = await _remoteDataSource.getItemsWithoutAllergen(allergen);
      final items = dtos.map(MenuMapper.menuItemDtoToEntity).toList();
      return Right(items);
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return const Left(Failure.network());
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MenuItem>> getItemById(String itemId) async {
    try {
      final dto = await _remoteDataSource.getItemById(itemId);
      final item = MenuMapper.menuItemDtoToEntity(dto);
      return Right(item);
    } on NotFoundException catch (e) {
      return Left(Failure.notFound(e.message));
    } on ServerException catch (e) {
      return Left(Failure.server(e.message));
    } on NetworkException catch (e) {
      return const Left(Failure.network());
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cacheMenu(Menu menu) async {
    try {
      await _localStorage.put(_menuCacheKey, menu);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Menu?>> getCachedMenu() async {
    try {
      final menu = await _localStorage.get(_menuCacheKey) as Menu?;
      return Right(menu);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearCachedMenu() async {
    try {
      await _localStorage.delete(_menuCacheKey);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    } catch (e) {
      return Left(Failure.unexpected(e.toString()));
    }
  }

  /// Map MenuCategory enum to string
  String _mapCategoryToString(MenuCategory category) {
    switch (category) {
      case MenuCategory.appetizers:
        return 'APPETIZERS';
      case MenuCategory.mainCourse:
        return 'MAIN_COURSE';
      case MenuCategory.desserts:
        return 'DESSERTS';
      case MenuCategory.beverages:
        return 'BEVERAGES';
      case MenuCategory.soups:
        return 'SOUPS';
      case MenuCategory.salads:
        return 'SALADS';
    }
  }
}

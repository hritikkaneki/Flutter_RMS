import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_storage.g.dart';

/// Hive box names
class HiveBoxes {
  static const String user = 'user_box';
  static const String menu = 'menu_box';
  static const String orders = 'orders_box';
  static const String tables = 'tables_box';
  static const String settings = 'settings_box';
}

/// Hive storage provider
@riverpod
Future<HiveStorage> hiveStorage(Ref ref) async {
  await Hive.initFlutter();
  return HiveStorage();
}

/// Hive storage for local caching (offline support)
class HiveStorage {
  // ══════════════════════════════════════════════════════════════════════════
  // Box management
  // ══════════════════════════════════════════════════════════════════════════

  /// Open a box
  Future<Box<T>> openBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    }
    return Hive.box<T>(boxName);
  }

  /// Close a box
  Future<void> closeBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).close();
    }
  }

  /// Delete a box
  Future<void> deleteBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).deleteFromDisk();
    } else {
      await Hive.deleteBoxFromDisk(boxName);
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // CRUD operations
  // ══════════════════════════════════════════════════════════════════════════

  /// Save single item
  Future<void> put<T>(String boxName, String key, T value) async {
    final box = await openBox<T>(boxName);
    await box.put(key, value);
  }

  /// Get single item
  Future<T?> get<T>(String boxName, String key) async {
    final box = await openBox<T>(boxName);
    return box.get(key);
  }

  /// Delete single item
  Future<void> delete(String boxName, String key) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  /// Save multiple items
  Future<void> putAll<T>(String boxName, Map<String, T> entries) async {
    final box = await openBox<T>(boxName);
    await box.putAll(entries);
  }

  /// Get all items
  Future<Map<String, T>> getAll<T>(String boxName) async {
    final box = await openBox<T>(boxName);
    return Map<String, T>.from(box.toMap());
  }

  /// Clear all items in a box
  Future<void> clear(String boxName) async {
    final box = await openBox(boxName);
    await box.clear();
  }

  /// Check if key exists
  Future<bool> containsKey(String boxName, String key) async {
    final box = await openBox(boxName);
    return box.containsKey(key);
  }

  /// Get box length
  Future<int> length(String boxName) async {
    final box = await openBox(boxName);
    return box.length;
  }

  // ══════════════════════════════════════════════════════════════════════════
  // List operations
  // ══════════════════════════════════════════════════════════════════════════

  /// Save list of items
  Future<void> saveList<T>(String boxName, List<T> items) async {
    final box = await openBox<T>(boxName);
    await box.clear();
    await box.addAll(items);
  }

  /// Get list of items
  Future<List<T>> getList<T>(String boxName) async {
    final box = await openBox<T>(boxName);
    return box.values.toList().cast<T>();
  }

  /// Add item to list
  Future<void> addToList<T>(String boxName, T item) async {
    final box = await openBox<T>(boxName);
    await box.add(item);
  }

  /// Remove item from list at index
  Future<void> removeFromList(String boxName, int index) async {
    final box = await openBox(boxName);
    await box.deleteAt(index);
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Utility methods
  // ══════════════════════════════════════════════════════════════════════════

  /// Clear all boxes
  Future<void> clearAll() async {
    await Future.wait([
      clear(HiveBoxes.user),
      clear(HiveBoxes.menu),
      clear(HiveBoxes.orders),
      clear(HiveBoxes.tables),
      clear(HiveBoxes.settings),
    ]);
  }

  /// Close all boxes
  Future<void> closeAll() async {
    await Hive.close();
  }
}

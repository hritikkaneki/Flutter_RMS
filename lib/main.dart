import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for local storage
  await Hive.initFlutter();

  // TODO: Initialize Firebase (if needed for push notifications)

  runApp(
    const ProviderScope(
      child: RestaurantManagementApp(),
    ),
  );
}

/// Main application widget with GoRouter-driven navigation
class RestaurantManagementApp extends ConsumerWidget {
  const RestaurantManagementApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get router from Riverpod (watches auth state internally)
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Restaurant Management System',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.light, // TODO: Get from settings provider
      routerConfig: router,
    );
  }
}

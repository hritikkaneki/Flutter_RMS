import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/menu/presentation/screens/menu_screen.dart';
import '../../features/cart/presentation/screens/cart_screen.dart';
import '../../features/cart/presentation/screens/order_history_screen.dart';
import 'app_routes.dart';

part 'app_router.g.dart';

/// GoRouter configuration provider
///
/// Routes are driven reactively by auth state:
/// - Unauthenticated → [SplashScreen] → [LoginScreen]
/// - Authenticated → [HomeScreen]
///
/// Route guards are enforced via [redirect] callback watching [authProvider]
@riverpod
GoRouter goRouter(Ref ref) {
  // Watch auth state to trigger redirects when auth changes
  final authState = ref.watch(authProvider);

  return GoRouter(
    debugLogDiagnostics: true,
    // Initial route
    initialLocation: AppRoutes.splash,
    // Reactive redirect based on auth state
    redirect: (context, state) {
      final isLoggedIn = authState.value != null;
      final isLoading = authState.isLoading;
      final isOnLoginScreen = state.matchedLocation == AppRoutes.login;
      final isOnSplashScreen = state.matchedLocation == AppRoutes.splash;

      // While loading auth state, always show splash
      if (isLoading) {
        return AppRoutes.splash;
      }

      // If logged in, redirect away from login/splash screens
      if (isLoggedIn) {
        if (isOnLoginScreen || isOnSplashScreen) {
          return AppRoutes.home;
        }
        // Stay on current route if already authenticated
        return null;
      }

      // If not logged in, force to login (unless on splash/login)
      if (!isLoggedIn && !isOnLoginScreen && !isOnSplashScreen) {
        return AppRoutes.login;
      }

      // Allow navigation to continue as-is
      return null;
    },
    // Route definitions
    routes: [
      // Splash screen route
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      // Login screen route
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      // Home screen route
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      // Menu screen route
      GoRoute(
        path: AppRoutes.menu,
        builder: (context, state) => const MenuScreen(),
      ),
      // Cart screen route
      GoRoute(
        path: AppRoutes.cart,
        builder: (context, state) => const CartScreen(),
      ),
      // Order history route
      GoRoute(
        path: AppRoutes.orderHistory,
        builder: (context, state) => const OrderHistoryScreen(),
      ),
  );
}

/// Placeholder home screen (Phase 3)
///
/// Will be replaced with actual dashboard in Phase 4
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authProvider.notifier).logout(),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text(
                'Welcome, ${user?.name ?? 'User'}!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Role: ${user?.role.displayName ?? 'Unknown'}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 24),
              Text(
                'You are successfully logged in!',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const Text(
                      '🎉 Phase 4 Started!',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Feature modules are being built. Explore the menu to get started!',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    // Feature buttons
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.restaurant_menu),
                        label: const Text('Browse Menu'),
                        onPressed: () => context.go(AppRoutes.menu),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text('Shopping Cart'),
                        onPressed: () => context.go(AppRoutes.cart),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.receipt_long),
                        label: const Text('Order History'),
                        onPressed: () => context.go(AppRoutes.orderHistory),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      '⏳ Coming Soon',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: null,
                            child: const Text('Tables'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: null,
                            child: const Text('Kitchen'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

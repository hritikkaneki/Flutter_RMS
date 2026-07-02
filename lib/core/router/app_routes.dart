/// Centralized route path constants for [GoRouter].
///
/// Keeping these in one place avoids typos scattered across `context.go(...)`
/// calls as the route table grows in later phases.
abstract class AppRoutes {
  AppRoutes._();

  // Auth routes
  static const String splash = '/splash';
  static const String login = '/login';

  // Dashboard routes
  static const String home = '/home';
  static const String menu = '/menu';
  static const String cart = '/cart';
  static const String orderHistory = '/orders';
  // TODO: tables, kitchen routes in Phase 4d/4e
}

/// Centralized route path constants for [GoRouter].
///
/// Keeping these in one place avoids typos scattered across `context.go(...)`
/// calls as the route table grows in later phases (menu, orders, tables...).
abstract class AppRoutes {
  AppRoutes._();

  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
}

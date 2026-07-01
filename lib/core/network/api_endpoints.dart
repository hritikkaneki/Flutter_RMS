/// API endpoint constants
class ApiEndpoints {
  ApiEndpoints._();

  // Auth endpoints
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';

  // User endpoints
  static const String users = '/users';
  static String user(String id) => '/users/$id';
  static String activateUser(String id) => '/users/$id/activate';
  static String deactivateUser(String id) => '/users/$id/deactivate';
  static String changePassword(String id) => '/users/$id/change-password';

  // Category endpoints
  static const String categories = '/categories';
  static String category(String id) => '/categories/$id';

  // Menu item endpoints
  static const String menuItems = '/menu-items';
  static String menuItem(String id) => '/menu-items/$id';
  static String menuItemImage(String id) => '/menu-items/$id/image';
  static String toggleMenuItemAvailability(String id) =>
      '/menu-items/$id/toggle-availability';
  static const String searchMenuItems = '/menu-items/search';

  // Table endpoints
  static const String tables = '/tables';
  static String table(String id) => '/tables/$id';
  static String tableQr(String id) => '/tables/$id/qr';
  static String updateTableStatus(String id) => '/tables/$id/status';
  static const String searchTables = '/tables/search';

  // Order endpoints
  static const String orders = '/orders';
  static String order(String id) => '/orders/$id';
  static String updateOrderStatus(String id) => '/orders/$id/status';
  static String updatePaymentStatus(String id) => '/orders/$id/payment-status';
  static String cancelOrder(String id) => '/orders/$id/cancel';
  static const String searchOrders = '/orders/search';

  // Kitchen endpoints
  static const String kitchenOrders = '/kitchen/orders';
  static const String kitchenPendingOrders = '/kitchen/orders/pending';
  static const String kitchenActiveOrders = '/kitchen/orders/active';
  static const String kitchenPreparingOrders = '/kitchen/orders/preparing';
  static String startPreparingOrder(String id) => '/kitchen/orders/$id/start';
  static String markOrderReady(String id) => '/kitchen/orders/$id/ready';
  static const String kitchenStatistics = '/kitchen/statistics';

  // Analytics endpoints
  static const String analyticsSales = '/analytics/sales';
  static const String analyticsRevenue = '/analytics/revenue';
  static const String analyticsTopItems = '/analytics/top-items';
  static const String analyticsStaffPerformance = '/analytics/staff-performance';
  static const String analyticsDashboard = '/analytics/dashboard';
}

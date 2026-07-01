/// Application-wide constants
class AppConstants {
  AppConstants._();

  // App info
  static const String appName = 'Restaurant Management System';
  static const String appVersion = '1.0.0';

  // API configuration
  static const String apiBaseUrl =
      String.fromEnvironment('API_BASE_URL', defaultValue: 'http://localhost:8080/api/v1');

  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Storage keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userKey = 'cached_user';
  static const String themeKey = 'theme_mode';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Image upload
  static const int maxImageSizeMB = 5;
  static const List<String> supportedImageFormats = ['jpg', 'jpeg', 'png', 'webp'];

  // Cache duration
  static const Duration cacheExpiry = Duration(hours: 24);

  // Rate limiting (UI side - for retry logic)
  static const Duration retryDelay = Duration(seconds: 2);
  static const int maxRetries = 3;

  // Date formats
  static const String dateFormat = 'yyyy-MM-dd';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm:ss';
  static const String displayDateFormat = 'MMM dd, yyyy';
  static const String displayDateTimeFormat = 'MMM dd, yyyy hh:mm a';

  // Currency
  static const String currencySymbol = '\$';
  static const String currencyCode = 'USD';

  // Animation durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);

  // Debounce duration (for search)
  static const Duration debounceDuration = Duration(milliseconds: 500);
}

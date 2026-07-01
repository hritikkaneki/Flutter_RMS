import 'package:intl/intl.dart';

import '../constants/app_constants.dart';

/// Formatting utilities for display
class Formatters {
  Formatters._();

  // ══════════════════════════════════════════════════════════════════════════
  // Currency formatting
  // ══════════════════════════════════════════════════════════════════════════

  /// Format amount as currency (e.g., $12.99)
  static String currency(double amount) {
    return '${AppConstants.currencySymbol}${amount.toStringAsFixed(2)}';
  }

  /// Format amount with comma separators (e.g., $1,234.56)
  static String currencyWithCommas(double amount) {
    final formatter = NumberFormat.currency(
      symbol: AppConstants.currencySymbol,
      decimalDigits: 2,
    );
    return formatter.format(amount);
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Date formatting
  // ══════════════════════════════════════════════════════════════════════════

  /// Format DateTime to display date (e.g., Jan 15, 2026)
  static String date(DateTime dateTime) {
    return DateFormat(AppConstants.displayDateFormat).format(dateTime);
  }

  /// Format DateTime to display date and time (e.g., Jan 15, 2026 02:30 PM)
  static String dateTime(DateTime dateTime) {
    return DateFormat(AppConstants.displayDateTimeFormat).format(dateTime);
  }

  /// Format DateTime to time only (e.g., 02:30 PM)
  static String time(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  /// Format DateTime to API format (e.g., 2026-01-15)
  static String dateForApi(DateTime dateTime) {
    return DateFormat(AppConstants.dateFormat).format(dateTime);
  }

  /// Format DateTime to API format with time (e.g., 2026-01-15 14:30:00)
  static String dateTimeForApi(DateTime dateTime) {
    return DateFormat(AppConstants.dateTimeFormat).format(dateTime);
  }

  /// Format relative time (e.g., "2 hours ago", "just now")
  static String relativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      final minutes = difference.inMinutes;
      return '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 30) {
      final days = difference.inDays;
      return '$days ${days == 1 ? 'day' : 'days'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Number formatting
  // ══════════════════════════════════════════════════════════════════════════

  /// Format number with comma separators (e.g., 1,234)
  static String number(int value) {
    return NumberFormat('#,###').format(value);
  }

  /// Format decimal with comma separators (e.g., 1,234.56)
  static String decimal(double value, {int decimalPlaces = 2}) {
    return NumberFormat('#,##0.${'0' * decimalPlaces}').format(value);
  }

  /// Format percentage (e.g., 75.5%)
  static String percentage(double value, {int decimalPlaces = 1}) {
    return '${value.toStringAsFixed(decimalPlaces)}%';
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Text formatting
  // ══════════════════════════════════════════════════════════════════════════

  /// Capitalize first letter of each word
  static String titleCase(String text) {
    if (text.isEmpty) return text;
    return text
        .split(' ')
        .map((word) => word.isEmpty
            ? word
            : word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  /// Truncate text with ellipsis
  static String truncate(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  /// Format order number (e.g., ORD-001234)
  static String orderNumber(String number) {
    return number.toUpperCase();
  }

  /// Format table number (e.g., Table 12)
  static String tableNumber(int number) {
    return 'Table $number';
  }

  // ══════════════════════════════════════════════════════════════════════════
  // File size formatting
  // ══════════════════════════════════════════════════════════════════════════

  /// Format file size (e.g., 1.5 MB)
  static String fileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    } else {
      return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
    }
  }
}

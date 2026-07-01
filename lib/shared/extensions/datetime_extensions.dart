import 'package:intl/intl.dart';

/// DateTime extension methods
extension DateTimeExtensions on DateTime {
  /// Format to display date (e.g., Jan 15, 2026)
  String get toDisplayDate {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  /// Format to display date and time (e.g., Jan 15, 2026 02:30 PM)
  String get toDisplayDateTime {
    return DateFormat('MMM dd, yyyy hh:mm a').format(this);
  }

  /// Format to time only (e.g., 02:30 PM)
  String get toDisplayTime {
    return DateFormat('hh:mm a').format(this);
  }

  /// Format to API format (e.g., 2026-01-15)
  String get toApiDate {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  /// Format to API format with time (e.g., 2026-01-15T14:30:00)
  String get toApiDateTime {
    return DateFormat('yyyy-MM-ddTHH:mm:ss').format(this);
  }

  /// Get relative time (e.g., "2 hours ago")
  String get toRelativeTime {
    final now = DateTime.now();
    final difference = now.difference(this);

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

  /// Check if today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Check if this week
  bool get isThisWeek {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    return isAfter(startOfWeek) && isBefore(endOfWeek);
  }

  /// Get start of day (00:00:00)
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  /// Get end of day (23:59:59)
  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59);
  }

  /// Add days
  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  /// Subtract days
  DateTime subtractDays(int days) {
    return subtract(Duration(days: days));
  }
}

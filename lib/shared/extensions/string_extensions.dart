/// String extension methods
extension StringExtensions on String {
  /// Capitalize first letter
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Capitalize first letter of each word
  String get titleCase {
    if (isEmpty) return this;
    return split(' ')
        .map((word) => word.isEmpty
            ? word
            : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}')
        .join(' ');
  }

  /// Check if string is email
  bool get isEmail {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(this);
  }

  /// Check if string is phone number
  bool get isPhone {
    return RegExp(r'^\+?[1-9]\d{1,14}$')
        .hasMatch(replaceAll(RegExp(r'[\s-]'), ''));
  }

  /// Check if string is numeric
  bool get isNumeric {
    return double.tryParse(this) != null;
  }

  /// Truncate string with ellipsis
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }

  /// Remove all whitespace
  String get removeWhitespace {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Parse to int (safe)
  int? get toIntOrNull {
    return int.tryParse(this);
  }

  /// Parse to double (safe)
  double? get toDoubleOrNull {
    return double.tryParse(this);
  }

  /// Check if empty or null
  bool get isNullOrEmpty {
    return trim().isEmpty;
  }
}

/// Nullable string extension
extension NullableStringExtensions on String? {
  /// Check if null or empty
  bool get isNullOrEmpty {
    return this == null || this!.trim().isEmpty;
  }

  /// Get value or default
  String orEmpty() {
    return this ?? '';
  }

  /// Get value or default
  String orDefault(String defaultValue) {
    return this ?? defaultValue;
  }
}

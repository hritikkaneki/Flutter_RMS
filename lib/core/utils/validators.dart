/// Form validation utilities
class Validators {
  Validators._();

  // ══════════════════════════════════════════════════════════════════════════
  // Email validation
  // ══════════════════════════════════════════════════════════════════════════

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Password validation
  // ══════════════════════════════════════════════════════════════════════════

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? strongPassword(String? value) {
    final baseError = password(value);
    if (baseError != null) return baseError;

    final hasUppercase = value!.contains(RegExp(r'[A-Z]'));
    final hasLowercase = value.contains(RegExp(r'[a-z]'));
    final hasDigit = value.contains(RegExp(r'[0-9]'));
    final hasSpecialChar = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!hasLowercase) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!hasDigit) {
      return 'Password must contain at least one number';
    }
    if (!hasSpecialChar) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  static String? confirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Required field
  // ══════════════════════════════════════════════════════════════════════════

  static String? required(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Number validation
  // ══════════════════════════════════════════════════════════════════════════

  static String? number(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    if (double.tryParse(value) == null) {
      return '$fieldName must be a valid number';
    }
    return null;
  }

  static String? positiveNumber(String? value, {String fieldName = 'This field'}) {
    final baseError = number(value, fieldName: fieldName);
    if (baseError != null) return baseError;

    final numValue = double.parse(value!);
    if (numValue <= 0) {
      return '$fieldName must be greater than zero';
    }
    return null;
  }

  static String? integer(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    if (int.tryParse(value) == null) {
      return '$fieldName must be a whole number';
    }
    return null;
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Length validation
  // ══════════════════════════════════════════════════════════════════════════

  static String? minLength(String? value, int minLength, {String fieldName = 'This field'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    if (value.length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }
    return null;
  }

  static String? maxLength(String? value, int maxLength, {String fieldName = 'This field'}) {
    if (value != null && value.length > maxLength) {
      return '$fieldName must not exceed $maxLength characters';
    }
    return null;
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Phone validation
  // ══════════════════════════════════════════════════════════════════════════

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
    if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'[\s-]'), ''))) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Price validation
  // ══════════════════════════════════════════════════════════════════════════

  static String? price(String? value) {
    final baseError = positiveNumber(value, fieldName: 'Price');
    if (baseError != null) return baseError;

    final numValue = double.parse(value!);
    if (numValue > 999999.99) {
      return 'Price must be less than 1,000,000';
    }
    return null;
  }
}

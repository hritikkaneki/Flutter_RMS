import 'package:flutter/material.dart';

/// BuildContext extensions for easier access to theme, size, etc.
extension ContextExtensions on BuildContext {
  // ══════════════════════════════════════════════════════════════════════════
  // Theme access
  // ══════════════════════════════════════════════════════════════════════════

  /// Access theme data
  ThemeData get theme => Theme.of(this);

  /// Access text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Access color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Check if dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  // ══════════════════════════════════════════════════════════════════════════
  // Media query access
  // ══════════════════════════════════════════════════════════════════════════

  /// Access media query data
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Screen size
  Size get screenSize => MediaQuery.of(this).size;

  /// Screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Screen padding (safe area)
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// View insets (keyboard)
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  // ══════════════════════════════════════════════════════════════════════════
  // Responsive breakpoints
  // ══════════════════════════════════════════════════════════════════════════

  /// Is mobile screen (< 600px)
  bool get isMobile => screenWidth < 600;

  /// Is tablet screen (600px - 1024px)
  bool get isTablet => screenWidth >= 600 && screenWidth < 1024;

  /// Is desktop screen (>= 1024px)
  bool get isDesktop => screenWidth >= 1024;

  /// Get responsive value based on screen size
  T responsive<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Navigation
  // ══════════════════════════════════════════════════════════════════════════

  /// Navigate to route
  Future<T?> push<T>(Route<T> route) {
    return Navigator.of(this).push(route);
  }

  /// Pop current route
  void pop<T>([T? result]) {
    Navigator.of(this).pop(result);
  }

  /// Pop until first route
  void popUntilFirst() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }

  /// Check if can pop
  bool get canPop => Navigator.of(this).canPop();

  // ══════════════════════════════════════════════════════════════════════════
  // SnackBar
  // ══════════════════════════════════════════════════════════════════════════

  /// Show snackbar
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        action: action,
      ),
    );
  }

  /// Show error snackbar
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: colorScheme.error,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  /// Show success snackbar
  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Dialogs
  // ══════════════════════════════════════════════════════════════════════════

  /// Show dialog
  Future<T?> showAppDialog<T>(Widget dialog) {
    return showDialog<T>(
      context: this,
      builder: (context) => dialog,
    );
  }

  /// Show confirmation dialog
  Future<bool> showConfirmationDialog({
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) async {
    final result = await showDialog<bool>(
      context: this,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelText),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(confirmText),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  // ══════════════════════════════════════════════════════════════════════════
  // Focus
  // ══════════════════════════════════════════════════════════════════════════

  /// Unfocus (hide keyboard)
  void unfocus() {
    FocusScope.of(this).unfocus();
  }

  /// Request focus
  void requestFocus(FocusNode node) {
    FocusScope.of(this).requestFocus(node);
  }
}

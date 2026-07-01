import 'package:flutter/material.dart';

/// Central color palette for the Restaurant Management System.
/// Every color in the app must come from here — no hardcoded hex elsewhere.
abstract final class AppColors {
  // ── Brand ──────────────────────────────────────────────────────────────────
  static const Color primary = Color(0xFFE85D24);       // Warm amber-orange
  static const Color primaryLight = Color(0xFFF28C5A);
  static const Color primaryDark = Color(0xFFB84010);
  static const Color primaryContainer = Color(0xFFFFF0EA);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFF5C1A00);

  // ── Secondary (teal for status/kitchen) ────────────────────────────────────
  static const Color secondary = Color(0xFF1D9E75);
  static const Color secondaryLight = Color(0xFF5DCAA5);
  static const Color secondaryDark = Color(0xFF0F6E56);
  static const Color secondaryContainer = Color(0xFFE1F5EE);
  static const Color onSecondary = Color(0xFFFFFFFF);

  // ── Tertiary (purple for analytics) ───────────────────────────────────────
  static const Color tertiary = Color(0xFF7F77DD);
  static const Color tertiaryContainer = Color(0xFFEEEDFE);
  static const Color onTertiary = Color(0xFFFFFFFF);

  // ── Semantic ───────────────────────────────────────────────────────────────
  static const Color success = Color(0xFF1D9E75);
  static const Color successContainer = Color(0xFFE1F5EE);
  static const Color onSuccessContainer = Color(0xFF04342C);

  static const Color warning = Color(0xFFBA7517);
  static const Color warningContainer = Color(0xFFFAEEDA);
  static const Color onWarningContainer = Color(0xFF412402);

  static const Color error = Color(0xFFE24B4A);
  static const Color errorContainer = Color(0xFFFCEBEB);
  static const Color onErrorContainer = Color(0xFF501313);

  static const Color info = Color(0xFF378ADD);
  static const Color infoContainer = Color(0xFFE6F1FB);
  static const Color onInfoContainer = Color(0xFF042C53);

  // ── Order status colors ────────────────────────────────────────────────────
  static const Color statusPending = Color(0xFFBA7517);
  static const Color statusPendingBg = Color(0xFFFAEEDA);
  static const Color statusConfirmed = Color(0xFF378ADD);
  static const Color statusConfirmedBg = Color(0xFFE6F1FB);
  static const Color statusPreparing = Color(0xFF7F77DD);
  static const Color statusPreparingBg = Color(0xFFEEEDFE);
  static const Color statusReady = Color(0xFF1D9E75);
  static const Color statusReadyBg = Color(0xFFE1F5EE);
  static const Color statusServed = Color(0xFF3B6D11);
  static const Color statusServedBg = Color(0xFFEAF3DE);
  static const Color statusCancelled = Color(0xFFE24B4A);
  static const Color statusCancelledBg = Color(0xFFFCEBEB);

  // ── Table status colors ────────────────────────────────────────────────────
  static const Color tableAvailable = Color(0xFF1D9E75);
  static const Color tableOccupied = Color(0xFFE85D24);
  static const Color tableReserved = Color(0xFF378ADD);
  static const Color tableCleaning = Color(0xFFBA7517);

  // ── Neutral ────────────────────────────────────────────────────────────────
  static const Color grey50 = Color(0xFFF8F7F5);
  static const Color grey100 = Color(0xFFF1EFE8);
  static const Color grey200 = Color(0xFFD3D1C7);
  static const Color grey300 = Color(0xFFB4B2A9);
  static const Color grey400 = Color(0xFF888780);
  static const Color grey500 = Color(0xFF5F5E5A);
  static const Color grey600 = Color(0xFF444441);
  static const Color grey700 = Color(0xFF2C2C2A);
  static const Color grey800 = Color(0xFF1C1C1A);
  static const Color grey900 = Color(0xFF0E0E0D);

  // ── Light surface tokens ───────────────────────────────────────────────────
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceVariantLight = Color(0xFFF8F7F5);
  static const Color backgroundLight = Color(0xFFF1EFE8);
  static const Color outlineLight = Color(0xFFD3D1C7);
  static const Color outlineVariantLight = Color(0xFFE8E6DF);
  static const Color onSurfaceLight = Color(0xFF1C1C1A);
  static const Color onSurfaceVariantLight = Color(0xFF5F5E5A);

  // ── Dark surface tokens ────────────────────────────────────────────────────
  static const Color surfaceDark = Color(0xFF1C1C1A);
  static const Color surfaceVariantDark = Color(0xFF2C2C2A);
  static const Color backgroundDark = Color(0xFF141413);
  static const Color outlineDark = Color(0xFF444441);
  static const Color outlineVariantDark = Color(0xFF363634);
  static const Color onSurfaceDark = Color(0xFFF1EFE8);
  static const Color onSurfaceVariantDark = Color(0xFFB4B2A9);

  // ── Scrim / overlay ────────────────────────────────────────────────────────
  static const Color scrim = Color(0x99000000);
  static const Color shimmerBase = Color(0xFFE8E6DF);
  static const Color shimmerHighlight = Color(0xFFF8F7F5);

  // ── Convenience aliases (for backward compatibility) ──────────────────────
  static const Color surface = surfaceLight;
  static const Color background = backgroundLight;
  static const Color border = outlineLight;
  static const Color textPrimary = onSurfaceLight;
  static const Color textSecondary = onSurfaceVariantLight;
  static const Color inputFill = grey50;
  static const Color chipBackground = grey100;

  static const Color darkSurface = surfaceDark;
  static const Color darkBackground = backgroundDark;
  static const Color darkBorder = outlineDark;
  static const Color darkTextPrimary = onSurfaceDark;
  static const Color darkTextSecondary = onSurfaceVariantDark;
  static const Color darkInputFill = grey800;
}
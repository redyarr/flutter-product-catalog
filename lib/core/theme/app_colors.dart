import 'package:flutter/material.dart';

/// Centralized color tokens for Light and Dark Material 3 palettes.
///
/// Uses a refined neutral slate surface palette with a Deep Indigo (`#4F46E5`)
/// primary accent. Widgets must reference `Theme.of(context).colorScheme`.
abstract final class AppColors {
  // Primary Deep Indigo accent
  static const Color indigoPrimary = Color(0xFF4F46E5);
  static const Color indigoLightAccent = Color(0xFF818CF8);
  static const Color indigoContainerLight = Color(0xFFE0E7FF);
  static const Color indigoOnContainerLight = Color(0xFF1E1B4B);
  static const Color indigoContainerDark = Color(0xFF312E81);
  static const Color indigoOnContainerDark = Color(0xFFE0E7FF);

  // Light Slate Surfaces
  static const Color lightSurface = Color(0xFFF8FAFC);
  static const Color lightSurfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color lightSurfaceContainer = Color(0xFFF1F5F9);
  static const Color lightSurfaceContainerHigh = Color(0xFFE2E8F0);
  static const Color lightOnSurface = Color(0xFF0F172A);
  static const Color lightOnSurfaceVariant = Color(0xFF475569);
  static const Color lightOutlineVariant = Color(0xFFCBD5E1);

  // Dark Slate Surfaces
  static const Color darkSurface = Color(0xFF0B1120);
  static const Color darkSurfaceContainerLowest = Color(0xFF111827);
  static const Color darkSurfaceContainer = Color(0xFF1E293B);
  static const Color darkSurfaceContainerHigh = Color(0xFF334155);
  static const Color darkOnSurface = Color(0xFFF8FAFC);
  static const Color darkOnSurfaceVariant = Color(0xFF94A3B8);
  static const Color darkOutlineVariant = Color(0xFF334155);

  // Semantic accents
  static const Color lightError = Color(0xFFDC2626);
  static const Color lightErrorContainer = Color(0xFFFEE2E2);
  static const Color lightOnErrorContainer = Color(0xFF7F1D1D);
  static const Color darkError = Color(0xFFF87171);
  static const Color darkErrorContainer = Color(0xFF7F1D1D);
  static const Color darkOnErrorContainer = Color(0xFFFEE2E2);

  static const Color white = Color(0xFFFFFFFF);
  static const Color slateInk = Color(0xFF0F172A);
  static const Color lightSecondary = Color(0xFF0EA5E9);
  static const Color darkSecondary = Color(0xFF38BDF8);
  static const Color amberTint = Color(0xFFF59E0B);
}

/// Compatibility helper supporting `.withValues(alpha: ...)` across Flutter 3.24+.
extension ColorAlphaCompat on Color {
  Color withValues({double? alpha}) {
    if (alpha == null) {
      return this;
    }
    return withOpacity(alpha.clamp(0.0, 1.0));
  }
}

// Color tokens and ThemeData for the app — same 12-token structure and exact
// hex values as pethealthapp/web/theme.py's *_VARS dicts, so the two apps
// look like the same product. Dark is the default; light is the required
// alternate (Settings has the switcher, defaulting to dark).
//
// The 5 pastel themes mirror desktop exactly: light variants only. Dark
// variants of the pastels were designed and previewed (see
// pethealthapp/PASTEL_THEMES.md) but deliberately never wired into either
// app — not an Android-specific gap.

import 'package:flutter/material.dart';

class AppColors {
  final Color bg;
  final Color panel;
  final Color navUnderlay;
  final Color accent;
  final Color accentAmber;
  final Color accentPurple;
  final Color muted;
  final Color border;
  final Color text;
  final Color success;
  final Color error;
  final Color warning;

  const AppColors({
    required this.bg,
    required this.panel,
    required this.navUnderlay,
    required this.accent,
    required this.accentAmber,
    required this.accentPurple,
    required this.muted,
    required this.border,
    required this.text,
    required this.success,
    required this.error,
    required this.warning,
  });

  static const dark = AppColors(
    bg: Color(0xFF0F172A),
    panel: Color(0xFF1E293B),
    navUnderlay: Color(0xFF0B0F19),
    accent: Color(0xFF2DD4BF),
    accentAmber: Color(0xFFEAB308),
    accentPurple: Color(0xFFA855F7),
    muted: Color(0xFF64748B),
    border: Color(0xFF30363D),
    text: Color(0xFFF8FAFC),
    success: Color(0xFF10B981),
    error: Color(0xFFEF4444),
    warning: Color(0xFFF97316),
  );

  static const light = AppColors(
    bg: Color(0xFFF8FAFC),
    panel: Color(0xFFFFFFFF),
    navUnderlay: Color(0xFFE2E8F0),
    accent: Color(0xFF0D9488),
    accentAmber: Color(0xFFB45309),
    accentPurple: Color(0xFF9333EA),
    muted: Color(0xFF475569),
    border: Color(0xFFCBD5E1),
    text: Color(0xFF0F172A),
    success: Color(0xFF16A34A),
    error: Color(0xFFDC2626),
    warning: Color(0xFFEA580C),
  );

  // Pastel light variants — see pethealthapp/PASTEL_THEMES.md for the full
  // rationale. Green and Red shift their primary accent off-axis (teal /
  // rose) so it doesn't collide with the semantic success/error colors held
  // constant below.
  static const pastelPink = AppColors(
    bg: Color(0xFFFDF2F8),
    panel: Color(0xFFFFFFFF),
    navUnderlay: Color(0xFFFCE7F3),
    accent: Color(0xFFDB2777),
    accentAmber: Color(0xFFF59E0B),
    accentPurple: Color(0xFFA855F7),
    muted: Color(0xFF9D7A94),
    border: Color(0xFFF5C2E0),
    text: Color(0xFF4A1130),
    success: Color(0xFF16A34A),
    error: Color(0xFFDC2626),
    warning: Color(0xFFEA580C),
  );

  static const pastelBlue = AppColors(
    bg: Color(0xFFEFF6FF),
    panel: Color(0xFFFFFFFF),
    navUnderlay: Color(0xFFDBEAFE),
    accent: Color(0xFF2563EB),
    accentAmber: Color(0xFFEAB308),
    accentPurple: Color(0xFFA855F7),
    muted: Color(0xFF64748B),
    border: Color(0xFFBFDBFE),
    text: Color(0xFF1E3A5F),
    success: Color(0xFF16A34A),
    error: Color(0xFFDC2626),
    warning: Color(0xFFEA580C),
  );

  static const pastelGreen = AppColors(
    bg: Color(0xFFF0FDF4),
    panel: Color(0xFFFFFFFF),
    navUnderlay: Color(0xFFDCFCE7),
    accent: Color(0xFF0D9488),
    accentAmber: Color(0xFFEAB308),
    accentPurple: Color(0xFFA855F7),
    muted: Color(0xFF6B8072),
    border: Color(0xFFBBF7D0),
    text: Color(0xFF14532D),
    success: Color(0xFF16A34A),
    error: Color(0xFFDC2626),
    warning: Color(0xFFEA580C),
  );

  static const pastelPurple = AppColors(
    bg: Color(0xFFFAF5FF),
    panel: Color(0xFFFFFFFF),
    navUnderlay: Color(0xFFF3E8FF),
    accent: Color(0xFF9333EA),
    accentAmber: Color(0xFFF59E0B),
    accentPurple: Color(0xFFC026D3),
    muted: Color(0xFF8B7A9E),
    border: Color(0xFFE9D5FF),
    text: Color(0xFF4C1D75),
    success: Color(0xFF16A34A),
    error: Color(0xFFDC2626),
    warning: Color(0xFFEA580C),
  );

  static const pastelRed = AppColors(
    bg: Color(0xFFFEF2F2),
    panel: Color(0xFFFFFFFF),
    navUnderlay: Color(0xFFFEE2E2),
    accent: Color(0xFFE11D48),
    accentAmber: Color(0xFFD97706),
    accentPurple: Color(0xFFA855F7),
    muted: Color(0xFFA78080),
    border: Color(0xFFFECACA),
    text: Color(0xFF7F1D1D),
    success: Color(0xFF16A34A),
    error: Color(0xFFDC2626),
    warning: Color(0xFFEA580C),
  );

  // Registry — mirrors web/theme.py's VARS_BY_THEME/THEME_LABELS. "dark" is
  // the app default; every other key is Brightness.light (only the base
  // pair has a real dark variant — see the file header note above).
  static const Map<String, AppColors> byKey = {
    'dark': dark,
    'light': light,
    'pastel-pink': pastelPink,
    'pastel-blue': pastelBlue,
    'pastel-green': pastelGreen,
    'pastel-purple': pastelPurple,
    'pastel-red': pastelRed,
  };

  static const Map<String, String> labels = {
    'dark': 'Dark (default)',
    'light': 'Light',
    'pastel-pink': 'Pastel Pink',
    'pastel-blue': 'Pastel Blue',
    'pastel-green': 'Pastel Green',
    'pastel-purple': 'Pastel Purple',
    'pastel-red': 'Pastel Red',
  };
}

/// Matches reminder urgency (lib/data/repositories/reminders_repository.dart's
/// ReminderUrgency) and timeline type badges to a token color — same mapping
/// as web/theme.py's .pht-badge-* classes.
Color urgencyColor(AppColors colors, String urgency) {
  switch (urgency) {
    case 'overdue':
      return colors.error;
    case 'dueSoon':
      return colors.warning;
    case 'snoozed':
      return colors.muted;
    case 'done':
      return colors.success;
    case 'dismissed':
      return colors.muted;
    default: // upcoming
      return colors.accent;
  }
}

/// Human-readable label for the same urgency strings urgencyColor() takes.
String urgencyLabel(String urgency) {
  switch (urgency) {
    case 'overdue':
      return 'Overdue';
    case 'dueSoon':
      return 'Due soon';
    case 'snoozed':
      return 'Snoozed';
    case 'done':
      return 'Done';
    case 'dismissed':
      return 'Dismissed';
    default: // upcoming
      return 'Upcoming';
  }
}

ThemeData buildAppTheme(AppColors colors, Brightness brightness) {
  final scheme = ColorScheme(
    brightness: brightness,
    primary: colors.accent,
    onPrimary: brightness == Brightness.dark ? const Color(0xFF0B0F19) : Colors.white,
    secondary: colors.accentPurple,
    onSecondary: Colors.white,
    error: colors.error,
    onError: Colors.white,
    surface: colors.panel,
    onSurface: colors.text,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: scheme,
    scaffoldBackgroundColor: colors.bg,
    appBarTheme: AppBarTheme(backgroundColor: colors.navUnderlay, foregroundColor: colors.text),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colors.navUnderlay,
      selectedItemColor: colors.accent,
      unselectedItemColor: colors.muted,
    ),
    cardTheme: CardThemeData(
      color: colors.panel,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: colors.border)),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colors.accent,
      foregroundColor: brightness == Brightness.dark ? const Color(0xFF0B0F19) : Colors.white,
    ),
    dividerColor: colors.border,
    textTheme: Typography.material2021().black.apply(bodyColor: colors.text, displayColor: colors.text),
  );
}

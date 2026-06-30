import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// APP THEME – Centralised colours, typography & spacing tokens
// ─────────────────────────────────────────────────────────────────────────────

/// Role-specific primary colours used for AppBars, selected nav-items, etc.
class AppColors {
  // Role colours
  static const Color admin    = Colors.blue;
  static const Color customer = Colors.pink;
  static const Color rider    = Colors.orange;
  static const Color seller   = Colors.pink;

  // Semantic colours (shared)
  static const Color success  = Colors.green;
  static const Color warning  = Colors.orange;
  static const Color error    = Colors.red;
  static const Color info     = Colors.blue;

  // Neutral
  static const Color textPrimary   = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint      = Color(0xFFBDBDBD);
  static const Color divider       = Color(0xFFEEEEEE);
  static const Color background    = Color(0xFFF8F8F8);
  static const Color cardWhite     = Colors.white;

  // Status badge colours  (order lifecycle)
  static const Color statusNew       = Colors.blue;
  static const Color statusPreparing = Colors.orange;
  static const Color statusReady     = Colors.teal;
  static const Color statusOnWay     = Colors.indigo;
  static const Color statusDelivered = Colors.green;
  static const Color statusCancelled = Colors.red;
  static const Color statusPending   = Colors.orange;
  static const Color statusConfirmed = Colors.blue;
}

// ─────────────────────────────────────────────────────────────────────────────
// TEXT STYLES
// ─────────────────────────────────────────────────────────────────────────────
class AppTextStyles {
  /// Large page title – shown at the top of each tab (e.g. "ລາຍໄດ້")
  static TextStyle pageTitle({Color color = AppColors.textPrimary}) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: color,
  );

  /// Section heading inside a page (e.g. "ກິດຈະກຳຫຼ້າສຸດ")
  static TextStyle sectionHeader({Color? color}) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: color ?? Colors.grey.shade800,
  );

  /// Sub-section / card title
  static TextStyle cardTitle({Color? color}) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: color ?? AppColors.textPrimary,
  );

  /// Body / description text
  static TextStyle body({Color? color}) => TextStyle(
    fontSize: 14,
    color: color ?? AppColors.textSecondary,
  );

  /// Small label / caption
  static TextStyle caption({Color? color}) => TextStyle(
    fontSize: 12,
    color: color ?? AppColors.textSecondary,
  );

  /// Metric value (large number displayed on stat cards)
  static const TextStyle metricValue = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// SPACING & SHAPE TOKENS
// ─────────────────────────────────────────────────────────────────────────────
class AppDimens {
  static const double cardRadius       = 16.0;
  static const double badgeRadius      = 12.0;
  static const double buttonRadius     = 12.0;
  static const double smallRadius      = 8.0;
  static const double pagePadding      = 16.0;
  static const double cardPadding      = 16.0;
  static const double cardGap          = 10.0;
  static const double sectionSpacing   = 24.0;
  static const double cardElevation    = 2.0;
}

class AppShapes {
  static ShapeBorder card   = RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.cardRadius));
  static ShapeBorder badge  = RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.badgeRadius));
  static ShapeBorder button = RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.buttonRadius));
}

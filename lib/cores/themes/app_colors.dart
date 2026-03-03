import 'package:flutter/material.dart';

/// App Colors - Centralized color definitions for the Foodpanda app
/// All colors should be defined here and imported where needed
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // ==================== Primary Brand Colors ====================
  /// Primary brand color - Pink (Foodpanda brand)
  static const Color primary = Color(0xFFE91E63);
  static const Color primaryLight = Color(0xFFF48FB1);
  static const Color primaryDark = Color(0xFFC2185B);

  // ==================== Role Colors ====================
  /// Admin role color
  static const Color admin = Color(0xFF2196F3); // Blue

  /// Customer role color
  static const Color customer = Color(0xFF4CAF50); // Green

  /// Rider role color
  static const Color rider = Color(0xFFFF9800); // Orange

  // ==================== Order Status Colors ====================
  /// Pending status
  static const Color statusPending = Color(0xFFFF9800); // Orange

  /// Confirmed status
  static const Color statusConfirmed = Color(0xFF2196F3); // Blue

  /// Preparing status
  static const Color statusPreparing = Color(0xFF9C27B0); // Purple

  /// On the way status
  static const Color statusOnTheWay = Color(0xFF3F51B5); // Indigo

  /// Delivered status
  static const Color statusDelivered = Color(0xFF4CAF50); // Green

  /// Default/Unknown status
  static const Color statusDefault = Color(0xFF9E9E9E); // Grey

  // ==================== Semantic Colors ====================
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // ==================== Neutral Colors ====================
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  // ==================== Grey Scale ====================
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // ==================== Background Colors ====================
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // ==================== Text Colors ====================
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color textHint = Color(0xFF9E9E9E);

  // ==================== Gradient Colors ====================
  /// Primary gradient for splash/login screens
  static const List<Color> primaryGradient = [
    Color(0xFFEC407A), // Pink 400
    Color(0xFFC2185B), // Pink 700
  ];

  // ==================== Opacity Helpers ====================
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
}

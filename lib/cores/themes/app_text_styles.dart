import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';

/// Central text-style registry for the FoodPanda app.
///
/// - **Context-aware styles** (use `AppTextStyles.of(context)`) pull colours
///   from the active [Theme] so they adapt to light / dark mode.
/// - **Static brand styles** (e.g. [appName], [tagline]) are used on branded
///   pink backgrounds and do not depend on the theme.
class AppTextStyles {
  final BuildContext context;

  AppTextStyles._(this.context);

  factory AppTextStyles.of(BuildContext context) => AppTextStyles._(context);

  // ── Theme-aware colour helpers ────────────────────────────────────────────
  Color get _heading => Theme.of(context).textTheme.headlineMedium!.color!;
  Color get _body => Theme.of(context).textTheme.bodyLarge!.color!;
  Color get _muted => Theme.of(context).textTheme.labelMedium!.color!;

  // ── Theme-aware styles ────────────────────────────────────────────────────
  TextStyle get headline1 =>
      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, color: _heading);

  TextStyle get headline2 =>
      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700, color: _heading);

  TextStyle get headline3 =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: _heading);

  TextStyle get subtitle1 =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: _heading);

  TextStyle get body1 => TextStyle(fontSize: 14.sp, color: _body);

  TextStyle get body2 => TextStyle(fontSize: 13.sp, color: _body);

  TextStyle get caption => TextStyle(fontSize: 12.sp, color: _muted);

  TextStyle get button => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  TextStyle get gradientText => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    foreground: Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
      ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
  );

  // ── Static brand styles (pink background) ────────────────────────────────

  /// Large bold app name displayed on the pink hero area.
  /// [fontSize] defaults to 38 sp (splash); pass 34 for login.
  static TextStyle appName({double fontSize = 38}) => TextStyle(
    fontSize: fontSize.sp,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    letterSpacing: -0.5,
    height: 1.1,
  );

  /// Short tagline below the app name on the pink hero area.
  /// [fontSize] defaults to 15 sp (splash); pass 14 for login.
  static TextStyle tagline({double fontSize = 15, double opacity = 0.9}) =>
      TextStyle(
        fontSize: fontSize.sp,
        color: Colors.white.withValues(alpha: opacity),
        fontWeight: FontWeight.w400,
        height: 1.55,
        letterSpacing: 0.2,
      );

  /// Bold headline inside the white bottom card.
  static TextStyle heroHeadline() => TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.dark,
    height: 1.35,
  );

  /// Smaller sub-tagline inside the white bottom card.
  static TextStyle subTagline() => TextStyle(
    fontSize: 13.sp,
    color: AppColors.grey,
    fontWeight: FontWeight.w400,
  );

  /// Tiny terms / privacy caption at the bottom of the login sheet.
  static TextStyle termsCaption() => TextStyle(
    fontSize: 11.sp,
    color: AppColors.greyLight,
    height: 1.5,
  );

  /// Label shown inside the loading overlay card.
  static TextStyle signingInLabel() => TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.dark,
  );

  /// Guest button text / outlined button label.
  static TextStyle outlinedButtonLabel() => TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
  );
}

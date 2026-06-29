import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';

class AppTextStyles {
  final BuildContext context;

  AppTextStyles._(this.context);

  factory AppTextStyles.of(BuildContext context) => AppTextStyles._(context);

  Color get _heading => Theme.of(context).textTheme.headlineMedium!.color!;
  Color get _body => Theme.of(context).textTheme.bodyLarge!.color!;
  Color get _muted => Theme.of(context).textTheme.labelMedium!.color!;

  TextStyle get h1 =>
      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, color: _heading);

  TextStyle get h2 =>
      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700, color: _heading);

  TextStyle get h3 =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: _heading);

  TextStyle get h4 =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: _heading);

  TextStyle get body1 => TextStyle(fontSize: 14.sp, color: _body);

  TextStyle get body2 => TextStyle(fontSize: 13.sp, color: _body);

  TextStyle get caption => TextStyle(fontSize: 12.sp, color: _muted);

  TextStyle get label => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: _muted,
    letterSpacing: 0.5,
  );

  TextStyle get button => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle appName({double fontSize = 38}) => TextStyle(
    fontSize: fontSize.sp,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    letterSpacing: -0.5,
    height: 1.1,
  );

  static TextStyle tagline({double fontSize = 15, double opacity = 0.9}) =>
      TextStyle(
        fontSize: fontSize.sp,
        color: Colors.white.withValues(alpha: opacity),
        fontWeight: FontWeight.w400,
        height: 1.55,
        letterSpacing: 0.2,
      );

  static TextStyle heroHeadline() => TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.dark,
    height: 1.35,
  );

  static TextStyle subTagline() => TextStyle(
    fontSize: 13.sp,
    color: AppColors.grey,
    fontWeight: FontWeight.w400,
  );

  static TextStyle termsCaption() => TextStyle(
    fontSize: 11.sp,
    color: AppColors.greyLight,
    height: 1.5,
  );

  static TextStyle signingInLabel() => TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.dark,
  );

  static TextStyle outlinedButtonLabel() => TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
  );
}

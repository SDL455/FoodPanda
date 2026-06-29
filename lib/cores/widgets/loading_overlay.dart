import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';
import 'package:foodpanda/cores/themes/app_text_styles.dart';

class LoadingOverlay extends StatelessWidget {
  final String message;

  const LoadingOverlay({super.key, this.message = 'Signing in...'});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.loadingScrim,
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 60.w),
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.h),
          decoration: BoxDecoration(
            color: AppColors.glassWhite,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.3),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowStrong,
                blurRadius: 40,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 32.w,
                height: 32.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.pink,
                ),
              ),
              SizedBox(height: 16.h),
              Text(message, style: AppTextStyles.signingInLabel()),
            ],
          ),
        ),
      ),
    );
  }
}

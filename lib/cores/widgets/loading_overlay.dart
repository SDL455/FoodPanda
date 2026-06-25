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
          padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 28.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 44.w,
                height: 44.w,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.pinkLight,
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

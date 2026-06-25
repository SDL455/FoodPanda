import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';
import 'package:foodpanda/cores/themes/app_text_styles.dart';
import 'package:foodpanda/cores/widgets/animated_fade_slide.dart';
import 'package:foodpanda/cores/widgets/animated_slide_up.dart';
import 'package:foodpanda/cores/widgets/bob_mascot.dart';
import 'package:foodpanda/cores/widgets/loading_overlay.dart';
import 'package:foodpanda/cores/widgets/login_background.dart';
import 'package:foodpanda/cores/widgets/social_login_button.dart';
import 'package:foodpanda/features/login/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinkLight,
      body: Stack(
        children: [
          // ── Gradient background ────────────────────────────────────
          const LoginBackground(),

          // ── Main layout ────────────────────────────────────────────
          Column(
            children: [
              // Top hero section (pink)
              Expanded(
                flex: 48,
                child: SafeArea(bottom: false, child: _HeroSection()),
              ),

              // White bottom sheet with login options
              AnimatedSlideUp(
                delay: const Duration(milliseconds: 300),
                child: _LoginSheet(controller: controller),
              ),
            ],
          ),

          // ── Loading overlay ────────────────────────────────────────
          Obx(
            () => controller.isLoading.value
                ? const LoadingOverlay()
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Hero section: mascot + title + tagline
// ─────────────────────────────────────────────────────────────────────────────
class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedFadeSlide(
      duration: const Duration(milliseconds: 700),
      beginOffset: const Offset(0, 0.18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Mascot with bob animation
          const BobMascot(height: 170, amplitude: 7),

          SizedBox(height: 18.h),

          // App name
          Text('foodpanda', style: AppTextStyles.appName(fontSize: 34)),

          SizedBox(height: 8.h),

          // Tagline
          Text(
            'Hungry? Get food delivered from\nyour favourite restaurants.',
            textAlign: TextAlign.center,
            style: AppTextStyles.tagline(fontSize: 14, opacity: 0.82),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Login sheet (white curved bottom card)
// ─────────────────────────────────────────────────────────────────────────────
class _LoginSheet extends StatelessWidget {
  final LoginController controller;
  const _LoginSheet({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 30,
            offset: Offset(0, -6),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(24.w, 28.h, 24.w, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.divider,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),

          SizedBox(height: 22.h),

          // ── Social buttons ──────────────────────────────────────────
          SocialLoginButton(
            label: 'Continue with Google',
            kind: SocialLoginKind.google,
            onPressed: controller.signInWithGoogle,
          ),

          SizedBox(height: 12.h),

          SocialLoginButton(
            label: 'Continue with Apple',
            kind: SocialLoginKind.apple,
            onPressed: controller.signInWithApple,
          ),

          SizedBox(height: 12.h),

          SocialLoginButton(
            label: 'Continue with Facebook',
            kind: SocialLoginKind.facebook,
            onPressed: controller.signInWithFacebook,
          ),

          SizedBox(height: 16.h),

          // ── Guest button ────────────────────────────────────────────
          Obx(
            () => _GuestButton(
              isLoading: controller.isLoading.value,
              onPressed: controller.continueAsGuest,
            ),
          ),

          SizedBox(height: 12.h),

          // Terms
          Center(
            child: Text(
              'By continuing, you agree to our Terms & Privacy Policy.',
              textAlign: TextAlign.center,
              style: AppTextStyles.termsCaption(),
            ),
          ),

          SizedBox(height: 28.h),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Guest button (login-specific)
// ─────────────────────────────────────────────────────────────────────────────
class _GuestButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  const _GuestButton({required this.isLoading, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.pinkLight,
          side: BorderSide(
            color: AppColors.pinkLight.withValues(alpha: 0.40),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
          textStyle: AppTextStyles.outlinedButtonLabel(),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: 20.w,
                height: 20.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.2,
                  color: AppColors.pinkLight,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_outline_rounded, size: 18.sp),
                  SizedBox(width: 8.w),
                  const Text('Continue as Guest'),
                ],
              ),
      ),
    );
  }
}

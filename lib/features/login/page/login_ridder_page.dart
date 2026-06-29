import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';
import 'package:foodpanda/cores/themes/app_text_styles.dart';
import 'package:foodpanda/cores/widgets/animated_fade_slide.dart';
import 'package:foodpanda/cores/widgets/animated_slide_up.dart';
import 'package:foodpanda/cores/widgets/bob_mascot.dart';
import 'package:foodpanda/cores/widgets/loading_overlay.dart';
import 'package:foodpanda/cores/widgets/login_background_ridder.dart';
import 'package:foodpanda/cores/widgets/login_input_field.dart';
import 'package:foodpanda/features/login/controller/login_ridder_controller.dart';
import 'package:get/get.dart';

class LoginRidderPage extends GetView<LoginRidderController> {
  LoginRidderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LoginBackgroundRidder(),

          Column(
            children: [
              Expanded(
                flex: 48,
                child: SafeArea(bottom: false, child: _HeroSection()),
              ),

              AnimatedSlideUp(
                delay: const Duration(milliseconds: 300),
                child: _LoginSheet(controller: controller),
              ),
            ],
          ),

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

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedFadeSlide(
      duration: const Duration(milliseconds: 700),
      beginOffset: const Offset(0, 0.18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BobMascot(height: 170, amplitude: 7),

          SizedBox(height: 18.h),

          Text('Ridder', style: AppTextStyles.appName(fontSize: 34)),

          SizedBox(height: 8.h),

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

class _LoginSheet extends StatelessWidget {
  final LoginRidderController controller;
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
          LoginInputField(
            controller: controller.phoneOrEmailController,
            hintText: 'ເບີໂທ ຫຼື ອີເມວ',
            prefixIcon: Icons.phone_android_rounded,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),

          Obx(
            () => LoginInputField(
              controller: controller.passwordController,
              hintText: 'ລະຫັດຜ່ານ',
              prefixIcon: Icons.lock_outline_rounded,
              obscureText: !controller.isPasswordVisible.value,
              suffixIcon: GestureDetector(
                onTap: controller.togglePasswordVisibility,
                child: Icon(
                  controller.isPasswordVisible.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.textGrey,
                  size: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Obx(
            () => GestureDetector(
              onTap: controller.isLoading.value ? null : controller.login,
              child: Container(
                width: double.infinity,
                height: 56.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF43A047), Color(0xFF2E7D32)],
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: controller.isLoading.value
                    ? Center(
                        child: SizedBox(
                          width: 24.w,
                          height: 24.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.2,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_bike_rounded,
                            color: Colors.white,
                            size: 22.w,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'ເຂົ້າສູ່ລະບົບ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/widgets/login_background.dart';
import 'package:foodpanda/cores/widgets/social_login_button.dart';
import 'package:foodpanda/features/login/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LoginBackground(),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    64.verticalSpace,

                    Image.asset(
                      'assets/image/background_icon.png',
                      width: 88.w,
                      height: 88.h,
                    ),

                    16.verticalSpace,

                    Text(
                      'FoodPanda',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),

                    12.verticalSpace,

                    Text(
                      'Hungry? Get food delivered from\nyour favourite restaurants.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 15.sp,
                        height: 1.5,
                      ),
                    ),

                    40.verticalSpace,

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(24.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 30,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          4.verticalSpace,
                          Text(
                            'Sign in to continue',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black45,
                            ),
                          ),
                          24.verticalSpace,

                          SocialLoginButton(
                            label: 'Continue with Google',
                            kind: SocialLoginKind.google,
                            onPressed: controller.signInWithGoogle,
                          ),

                          12.verticalSpace,

                          SocialLoginButton(
                            label: 'Continue with Apple',
                            kind: SocialLoginKind.apple,
                            onPressed: controller.signInWithApple,
                          ),

                          12.verticalSpace,

                          SocialLoginButton(
                            label: 'Continue with Facebook',
                            kind: SocialLoginKind.facebook,
                            onPressed: controller.signInWithFacebook,
                          ),

                          12.verticalSpace,

                          Obx(
                            () => TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 14.h),
                                foregroundColor: const Color(0xFFFF5A7D),
                                textStyle: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  side: BorderSide(
                                    color: const Color(0xFFFF5A7D).withValues(alpha: 0.3),
                                  ),
                                ),
                              ),
                              onPressed: controller.isLoading.value
                                  ? null
                                  : controller.continueAsGuest,
                              child: controller.isLoading.value
                                  ? SizedBox(
                                      height: 20.h,
                                      width: 20.h,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: const Color(0xFFFF5A7D),
                                      ),
                                    )
                                  : const Text('Continue as Guest'),
                            ),
                          ),
                        ],
                      ),
                    ),

                    32.verticalSpace,
                  ],
                ),
              ),
            ),
          ),

          Obx(
            () => controller.isLoading.value
                ? Container(
                    color: Colors.black.withValues(alpha: 0.3),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(24.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 48.w,
                              height: 48.h,
                              child: const CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Color(0xFFFF5A7D),
                              ),
                            ),
                            16.verticalSpace,
                            Text(
                              'Signing in...',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

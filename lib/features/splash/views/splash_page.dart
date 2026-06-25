import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';
import 'package:foodpanda/cores/themes/app_text_styles.dart';
import 'package:foodpanda/cores/widgets/animated_fade_slide.dart';
import 'package:foodpanda/cores/widgets/animated_slide_up.dart';
import 'package:foodpanda/cores/widgets/bob_mascot.dart';
import 'package:foodpanda/features/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pink,
      body: Stack(
        children: [
          // ── Pink gradient background ──────────────────────────────
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.pink, AppColors.pinkDeep],
              ),
            ),
          ),

          // ── Decorative city-silhouette tint at bottom of pink area ─
          Positioned(
            bottom: 260.h,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.12,
              child: SizedBox(
                height: 120.h,
                child: CustomPaint(painter: _CitySkylinePainter()),
              ),
            ),
          ),

          // ── Content ───────────────────────────────────────────────
          Column(
            children: [
              // Top section (pink area)
              Expanded(
                flex: 62,
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      SizedBox(height: 32.h),

                      // Logo icon
                      AnimatedFadeSlide(
                        delay: const Duration(milliseconds: 0),
                        child: const PandaLogoIcon(size: 72),
                      ),

                      SizedBox(height: 16.h),

                      // App name
                      AnimatedFadeSlide(
                        delay: const Duration(milliseconds: 150),
                        child: Text(
                          'foodpanda',
                          style: AppTextStyles.appName(fontSize: 38),
                        ),
                      ),

                      SizedBox(height: 6.h),

                      // Tagline
                      AnimatedFadeSlide(
                        delay: const Duration(milliseconds: 250),
                        child: Text(
                          'good food, delivered fast',
                          style: AppTextStyles.tagline(
                            fontSize: 15,
                            opacity: 0.9,
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Panda delivery mascot
                      AnimatedFadeSlide(
                        delay: const Duration(milliseconds: 350),
                        child: const BobMascot(height: 270),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom white card
              AnimatedSlideUp(
                delay: const Duration(milliseconds: 400),
                child: const _BottomCard(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Bottom white card (splash-specific content)
// ─────────────────────────────────────────────────────────────────────────────
class _BottomCard extends StatelessWidget {
  const _BottomCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      padding: EdgeInsets.fromLTRB(28.w, 28.h, 28.w, 36.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Headline
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTextStyles.heroHeadline(),
              children: const [
                TextSpan(text: 'Your favorite food,\n'),
                TextSpan(text: 'delivered '),
                TextSpan(
                  text: 'to your door',
                  style: TextStyle(color: AppColors.pink),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          // Sub-tagline
          Text(
            'From local favorites to all your cravings.',
            textAlign: TextAlign.center,
            style: AppTextStyles.subTagline(),
          ),

          SizedBox(height: 20.h),

          // Page indicator dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Dot(active: true),
              SizedBox(width: 6.w),
              _Dot(active: false),
              SizedBox(width: 6.w),
              _Dot(active: false),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Page indicator dot (splash-specific)
// ─────────────────────────────────────────────────────────────────────────────
class _Dot extends StatelessWidget {
  final bool active;
  const _Dot({required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: active ? 24.w : 7.w,
      height: 6.h,
      decoration: BoxDecoration(
        color: active
            ? AppColors.pink
            : AppColors.pink.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// City skyline decorative painter (splash-specific)
// ─────────────────────────────────────────────────────────────────────────────
class _CitySkylinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    final w = size.width;
    final h = size.height;

    final path = Path();
    path.moveTo(0, h);

    void building(double x, double bw, double bh) {
      path.lineTo(x, h);
      path.lineTo(x, h - bh);
      path.lineTo(x + bw * 0.3, h - bh);
      path.lineTo(x + bw * 0.3, h - bh - bh * 0.2);
      path.lineTo(x + bw * 0.5, h - bh - bh * 0.2);
      path.lineTo(x + bw * 0.5, h - bh);
      path.lineTo(x + bw, h - bh);
      path.lineTo(x + bw, h);
    }

    building(0, w * 0.08, h * 0.5);
    building(w * 0.1, w * 0.06, h * 0.8);
    building(w * 0.18, w * 0.05, h * 0.6);
    building(w * 0.25, w * 0.08, h * 0.9);
    building(w * 0.35, w * 0.07, h * 0.7);
    building(w * 0.44, w * 0.05, h * 0.55);
    building(w * 0.51, w * 0.09, h * 0.85);
    building(w * 0.62, w * 0.06, h * 0.65);
    building(w * 0.7, w * 0.08, h * 0.75);
    building(w * 0.8, w * 0.05, h * 0.5);
    building(w * 0.87, w * 0.07, h * 0.9);
    building(w * 0.95, w * 0.05, h * 0.6);

    path.lineTo(w, h);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

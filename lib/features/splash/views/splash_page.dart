import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/features/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF2B85),
      body: Stack(
        children: [
          // ── Pink gradient background ──────────────────────────────
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFF2B85), Color(0xFFE0006E)],
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
                      _AnimatedFade(
                        delay: const Duration(milliseconds: 0),
                        child: _PandaLogoIcon(),
                      ),

                      SizedBox(height: 16.h),

                      // App name
                      _AnimatedFade(
                        delay: const Duration(milliseconds: 150),
                        child: Text(
                          'foodpanda',
                          style: TextStyle(
                            fontSize: 38.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),

                      SizedBox(height: 6.h),

                      // Tagline
                      _AnimatedFade(
                        delay: const Duration(milliseconds: 250),
                        child: Text(
                          'good food, delivered fast',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white.withValues(alpha: 0.9),
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Panda delivery mascot (background_icon.png)
                      _AnimatedFade(
                        delay: const Duration(milliseconds: 350),
                        child: _AnimatedMascot(),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom white card
              _AnimatedSlideUp(
                delay: const Duration(milliseconds: 400),
                child: _BottomCard(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Panda Logo Icon (white circle with panda face drawn in Flutter)
// ─────────────────────────────────────────────────────────────────────────────
class _PandaLogoIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.w,
      height: 72.w,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: CustomPaint(
          size: Size(44.w, 44.w),
          painter: _PandaFacePainter(),
        ),
      ),
    );
  }
}

class _PandaFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final pink = const Color(0xFFFF2B85);
    final black = Colors.black;

    // Main face circle (pink)
    canvas.drawCircle(Offset(w / 2, h / 2), w / 2, Paint()..color = pink);

    // Left ear (black)
    canvas.drawCircle(
      Offset(w * 0.18, h * 0.18),
      w * 0.14,
      Paint()..color = black,
    );
    // Right ear (black)
    canvas.drawCircle(
      Offset(w * 0.82, h * 0.18),
      w * 0.14,
      Paint()..color = black,
    );

    // Face white inner circle
    canvas.drawCircle(
      Offset(w / 2, h / 2 + h * 0.04),
      w * 0.36,
      Paint()..color = Colors.white,
    );

    // Left eye patch (black)
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w * 0.35, h * 0.42),
        width: w * 0.18,
        height: h * 0.16,
      ),
      Paint()..color = black,
    );
    // Right eye patch (black)
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w * 0.65, h * 0.42),
        width: w * 0.18,
        height: h * 0.16,
      ),
      Paint()..color = black,
    );

    // Left eye white
    canvas.drawCircle(
      Offset(w * 0.35, h * 0.41),
      w * 0.06,
      Paint()..color = Colors.white,
    );
    // Right eye white
    canvas.drawCircle(
      Offset(w * 0.65, h * 0.41),
      w * 0.06,
      Paint()..color = Colors.white,
    );

    // Nose
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w / 2, h * 0.58),
        width: w * 0.12,
        height: h * 0.07,
      ),
      Paint()..color = black,
    );

    // Smile
    final smilePath = Path()
      ..moveTo(w * 0.38, h * 0.65)
      ..quadraticBezierTo(w / 2, h * 0.75, w * 0.62, h * 0.65);
    canvas.drawPath(
      smilePath,
      Paint()
        ..color = black
        ..style = PaintingStyle.stroke
        ..strokeWidth = w * 0.03
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─────────────────────────────────────────────────────────────────────────────
// Animated mascot — uses the existing background_icon.png asset
// ─────────────────────────────────────────────────────────────────────────────
class _AnimatedMascot extends StatefulWidget {
  @override
  State<_AnimatedMascot> createState() => _AnimatedMascotState();
}

class _AnimatedMascotState extends State<_AnimatedMascot>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _bob;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
    _bob = Tween<double>(
      begin: -6,
      end: 6,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bob,
      builder: (_, child) =>
          Transform.translate(offset: Offset(0, _bob.value), child: child),
      child: Image.asset(
        'assets/image/background_icon.png',
        height: 270.h,
        fit: BoxFit.contain,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Bottom white card
// ─────────────────────────────────────────────────────────────────────────────
class _BottomCard extends StatelessWidget {
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
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1A1A2E),
                height: 1.35,
              ),
              children: const [
                TextSpan(text: 'Your favorite food,\n'),
                TextSpan(text: 'delivered '),
                TextSpan(
                  text: 'to your door',
                  style: TextStyle(color: Color(0xFFFF2B85)),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),

          // Sub-tagline
          Text(
            'From local favorites to all your cravings.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              color: const Color(0xFF888888),
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 20.h),

          // Page indicator dot
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
            ? const Color(0xFFFF2B85)
            : const Color(0xFFFF2B85).withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// City skyline decorative painter
// ─────────────────────────────────────────────────────────────────────────────
class _CitySkylinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    final w = size.width;
    final h = size.height;

    final path = Path();
    path.moveTo(0, h);

    // Simple building silhouettes
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

// ─────────────────────────────────────────────────────────────────────────────
// Animation helpers
// ─────────────────────────────────────────────────────────────────────────────
class _AnimatedFade extends StatefulWidget {
  final Widget child;
  final Duration delay;
  const _AnimatedFade({required this.child, required this.delay});

  @override
  State<_AnimatedFade> createState() => _AnimatedFadeState();
}

class _AnimatedFadeState extends State<_AnimatedFade>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));

    Future.delayed(widget.delay, () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}

class _AnimatedSlideUp extends StatefulWidget {
  final Widget child;
  final Duration delay;
  const _AnimatedSlideUp({required this.child, required this.delay});

  @override
  State<_AnimatedSlideUp> createState() => _AnimatedSlideUpState();
}

class _AnimatedSlideUpState extends State<_AnimatedSlideUp>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<Offset> _slide;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));

    Future.delayed(widget.delay, () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}

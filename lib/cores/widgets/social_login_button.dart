import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';

enum SocialLoginKind { google, apple, facebook }

class SocialLoginButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final SocialLoginKind kind;

  const SocialLoginButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.kind = SocialLoginKind.google,
  });

  @override
  State<SocialLoginButton> createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleCtrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _scaleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.0,
      upperBound: 1.0,
      value: 1.0,
    );
    _scale = Tween<double>(
      begin: 0.96,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _scaleCtrl, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _scaleCtrl.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails _) => _scaleCtrl.reverse();
  void _onTapUp(TapUpDetails _) => _scaleCtrl.forward();
  void _onTapCancel() => _scaleCtrl.forward();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onPressed,
      child: ScaleTransition(scale: _scale, child: _buildButton()),
    );
  }

  Widget _buildButton() {
    switch (widget.kind) {
      case SocialLoginKind.google:
        return _SocialButtonShell(
          backgroundColor: Colors.white,
          borderColor: const Color(0xFFE8E8E8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _GoogleIcon(),
              SizedBox(width: 12.w),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF3C4043),
                ),
              ),
            ],
          ),
        );

      case SocialLoginKind.apple:
        return _SocialButtonShell(
          backgroundColor: const Color(0xFF050505),
          borderColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _AppleIcon(),
              SizedBox(width: 12.w),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );

      case SocialLoginKind.facebook:
        return _SocialButtonShell(
          backgroundColor: AppColors.pink,
          borderColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _FacebookIcon(),
              SizedBox(width: 12.w),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
    }
  }
}

// ── Button shell ─────────────────────────────────────────────────────────────
class _SocialButtonShell extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Widget child;

  const _SocialButtonShell({
    required this.backgroundColor,
    required this.borderColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: borderColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}

// ── Brand icons ───────────────────────────────────────────────────────────────
class _GoogleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22.w,
      height: 22.w,
      child: CustomPaint(painter: _GooglePainter()),
    );
  }
}

class _GooglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width / 2;

    // Pie slices (simplified G logo)
    final colors = [
      AppColors.Blue, // Blue top-right
      AppColors.Green, // Green bottom-right
      AppColors.Yellow, // Yellow bottom-left
      AppColors.Red, // Red top-left
    ];
    final starts = [0.0, 90.0, 180.0, 270.0];

    for (int i = 0; i < 4; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: r),
        _deg(starts[i]),
        _deg(90),
        true,
        Paint()..color = colors[i],
      );
    }

    // White centre circle
    canvas.drawCircle(Offset(cx, cy), r * 0.60, Paint()..color = Colors.white);

    // Right cutout for 'G' bar
    canvas.drawRect(
      Rect.fromLTWH(cx, cy - r * 0.18, r + 1, r * 0.36),
      Paint()..color = AppColors.Blue,
    );
    // White inner for bar
    canvas.drawRect(
      Rect.fromLTWH(cx, cy - r * 0.18, r * 0.40, r * 0.36),
      Paint()..color = Colors.white,
    );
  }

  double _deg(double d) => d * 3.14159265 / 180;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _AppleIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.apple, color: Colors.white, size: 22.sp);
  }
}

class _FacebookIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 22.w,
      height: 22.w,
      child: CustomPaint(painter: _FacebookPainter()),
    );
  }
}

class _FacebookPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // White circle background
    canvas.drawCircle(
      Offset(w / 2, h / 2),
      w / 2,
      Paint()..color = Colors.white,
    );

    // Blue 'f' letter
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'f',
        style: TextStyle(
          color: Color(0xFF1877F2),
          fontSize: 16,
          fontWeight: FontWeight.w900,
          fontFamily: 'Arial',
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset((w - textPainter.width) / 2 + 1, (h - textPainter.height) / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

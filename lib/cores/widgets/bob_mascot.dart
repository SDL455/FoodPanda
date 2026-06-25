import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';

class BobMascot extends StatefulWidget {
  final double height;
  final double amplitude;
  final Duration period;

  const BobMascot({
    super.key,
    this.height = 200,
    this.amplitude = 6,
    this.period = const Duration(milliseconds: 1800),
  });

  @override
  State<BobMascot> createState() => _BobMascotState();
}

class _BobMascotState extends State<BobMascot>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _bob;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.period)
      ..repeat(reverse: true);
    _bob = Tween<double>(
      begin: -widget.amplitude,
      end: widget.amplitude,
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
        height: widget.height.h,
        fit: BoxFit.contain,
        color: null,
      ),
    );
  }
}

class PandaLogoIcon extends StatelessWidget {
  final double size;

  const PandaLogoIcon({super.key, this.size = 72});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.w,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: CustomPaint(
          size: Size(size * 0.61, size * 0.61),
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
    const pink = AppColors.pink;
    const black = Colors.black;

    canvas.drawCircle(Offset(w / 2, h / 2), w / 2, Paint()..color = pink);

    canvas.drawCircle(
      Offset(w * 0.18, h * 0.18),
      w * 0.14,
      Paint()..color = black,
    );
    canvas.drawCircle(
      Offset(w * 0.82, h * 0.18),
      w * 0.14,
      Paint()..color = black,
    );

    canvas.drawCircle(
      Offset(w / 2, h / 2 + h * 0.04),
      w * 0.36,
      Paint()..color = Colors.white,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w * 0.35, h * 0.42),
        width: w * 0.18,
        height: h * 0.16,
      ),
      Paint()..color = black,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w * 0.65, h * 0.42),
        width: w * 0.18,
        height: h * 0.16,
      ),
      Paint()..color = black,
    );

    canvas.drawCircle(
      Offset(w * 0.35, h * 0.41),
      w * 0.06,
      Paint()..color = Colors.white,
    );
    canvas.drawCircle(
      Offset(w * 0.65, h * 0.41),
      w * 0.06,
      Paint()..color = Colors.white,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w / 2, h * 0.58),
        width: w * 0.12,
        height: h * 0.07,
      ),
      Paint()..color = black,
    );

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

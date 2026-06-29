import 'dart:math';
import 'package:flutter/material.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';

class LoginBackgroundRidder extends StatelessWidget {
  const LoginBackgroundRidder({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.0, -0.5),
          radius: 1.3,
          colors: [
            AppColors.greenLight,
            AppColors.primaryGreen,
            AppColors.darkGreen,
          ],
          stops: [0.0, 0.45, 1.0],
        ),
      ),
      child: Stack(
        children: [
          for (int i = 0; i < 6; i++)
            Positioned(
              top: size.height * _orbPositions[i].dy,
              left: size.width * _orbPositions[i].dx,
              child: _FloatingOrb(
                diameter: size.width * _orbSizes[i],
                opacity: _orbOpacities[i],
                delay: i * 0.8,
              ),
            ),
        ],
      ),
    );
  }
}

const _orbPositions = [
  Offset(-0.25, -0.30),
  Offset(0.80, 0.05),
  Offset(0.60, 0.30),
  Offset(-0.15, 0.55),
  Offset(0.90, 0.65),
  Offset(0.30, 0.75),
];

const _orbSizes = [0.70, 0.50, 0.35, 0.25, 0.30, 0.20];

const _orbOpacities = [0.10, 0.07, 0.06, 0.04, 0.05, 0.03];

class _FloatingOrb extends StatefulWidget {
  final double diameter;
  final double opacity;
  final double delay;

  const _FloatingOrb({
    required this.diameter,
    required this.opacity,
    required this.delay,
  });

  @override
  State<_FloatingOrb> createState() => _FloatingOrbState();
}

class _FloatingOrbState extends State<_FloatingOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    Future.delayed(Duration(milliseconds: (widget.delay * 1000).toInt()), () {
      if (mounted) _ctrl.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, sin(_ctrl.value * pi * 2) * 8),
          child: child,
        );
      },
      child: Opacity(
        opacity: widget.opacity,
        child: Container(
          width: widget.diameter,
          height: widget.diameter,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

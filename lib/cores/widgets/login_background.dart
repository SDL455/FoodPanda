import 'package:flutter/material.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.0, -0.5),
          radius: 1.3,
          colors: [AppColors.pinkLight, AppColors.pink, AppColors.pinkDeep],
          stops: [0.0, 0.45, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Top-left soft orb
          Positioned(
            top: -size.width * 0.30,
            left: -size.width * 0.25,
            child: _Orb(diameter: size.width * 0.70, opacity: 0.10),
          ),
          // Top-right accent orb
          Positioned(
            top: size.height * 0.05,
            right: -size.width * 0.20,
            child: _Orb(diameter: size.width * 0.50, opacity: 0.07),
          ),
          // Mid decorative orb
          Positioned(
            top: size.height * 0.30,
            left: size.width * 0.60,
            child: _Orb(diameter: size.width * 0.35, opacity: 0.06),
          ),
        ],
      ),
    );
  }
}

class _Orb extends StatelessWidget {
  final double diameter;
  final double opacity;
  const _Orb({required this.diameter, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: diameter,
        height: diameter,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

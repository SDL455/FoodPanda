import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Brand palette ──────────────────────────────────────────────────────
  static const Color pink = Color(0xFFFF2B85);
  static const Color pinkDeep = Color(0xFFE0006E);
  static const Color pinkLight = Color(0xFFFF2060);

  // ── Green rider palette ────────────────────────────────────────────────
  static const Color greenLight = Color(0xFF86EFAC);
  static const Color primaryGreen = Color(0xFF22C55E);
  static const Color darkGreen = Color(0xFF14532D);

  // ── Admin palette ──────────────────────────────────────────────────────
  static const Color indigo = Color(0xFF4F46E5);
  static const Color indigoLight = Color(0xFF818CF8);
  static const Color indigoDark = Color(0xFF312E81);

  // ── Core ───────────────────────────────────────────────────────────────
  static const Color primary = Color(0xFF2E7D32);
  static const Color primaryLight = Color(0xFF4CAF50);
  static const Color primaryDark = Color(0xFF1B5E20);
  static const Color accent = Color(0xFF00C853);

  // ── Neutrals ───────────────────────────────────────────────────────────
  static const Color dark = Color(0xFF1A1A2E);
  static const Color grey = Color(0xFF888888);
  static const Color greyLight = Color(0xFFBBBBBB);
  static const Color greyLighter = Color(0xFFE8E8E8);
  static const Color divider = Color(0xFFF0F0F0);
  static const Color background = Color(0xFFF8F9FA);
  static const Color scaffoldBg = Color(0xFFF5F5F7);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // ── Functional ─────────────────────────────────────────────────────────
  static const Color blue = Color(0xFF4285F4);
  static const Color green = Color(0xFF16A34A);
  static const Color yellow = Color(0xFFFBBC05);
  static const Color red = Color(0xFFEA4335);

  // ── Text ───────────────────────────────────────────────────────────────
  static const Color textDark = Color(0xFF1A1A2E);
  static const Color textGrey = Color(0xFF9E9E9E);
  static const Color textWhite = Color(0xFFFFFFFF);

  // ── Input ──────────────────────────────────────────────────────────────
  static const Color inputBorder = Color(0xFFE8E8E8);
  static const Color inputFill = Color(0xFFF5F5F5);

  // ── Aliases (backward compat) ──────────────────────────────────────────
  static const Color Green = greenLight;
  static const Color Blue = blue;
  static const Color Yellow = yellow;
  static const Color Red = red;
  static const Color LightGreen = greenLight;
  static const Color PrimaryGreen = primaryGreen;
  static const Color DarkGreen = darkGreen;

  // ── Glass / Shadow ─────────────────────────────────────────────────────
  static const Color shadowLight = Color(0x08000000);
  static const Color shadow = Color(0x22000000);
  static const Color shadowStrong = Color(0x33000000);
  static const Color loadingScrim = Color(0x59000000);
  static const Color glassWhite = Color(0x99FFFFFF);
  static const Color glassWhiteLight = Color(0x4DFFFFFF);
  static const Color glassDark = Color(0x331A1A2E);

  // ── Gradients ──────────────────────────────────────────────────────────
  static const LinearGradient pinkGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [pink, pinkDeep],
  );

  static const LinearGradient pinkRadial = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [pinkLight, pink, pinkDeep],
  );

  static const LinearGradient greenGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [greenLight, primaryGreen, darkGreen],
  );

  static const LinearGradient indigoGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [indigoLight, indigo, indigoDark],
  );

  static const LinearGradient orangeGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF6B35), Color(0xFFF7C948)],
  );

  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
  );

  static const LinearGradient purpleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF8B5CF6), Color(0xFF6D28D9)],
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foodpanda/features/splash/controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pinkAccent, Colors.pink],
          ),
        ),
        child: Obx(() {
          switch (controller.status) {
            case SplashStatus.checking:
              return _buildCheckingState();
            case SplashStatus.authenticated:
              return _buildAuthenticatedState();
            case SplashStatus.unauthenticated:
              return _buildUnauthenticatedState();
          }
        }),
      ),
    );
  }

  Widget _buildCheckingState() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          const Icon(Icons.restaurant, size: 100, color: Colors.white),
          const SizedBox(height: 24),
          const Text(
            'Foodpanda',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Bringing food to your door',
            style: TextStyle(fontSize: 16, color: Colors.white.withValues(alpha: 0.8)),
          ),
          const Spacer(flex: 1),
          const SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 3,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'Checking...',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }

  Widget _buildAuthenticatedState() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          const Icon(Icons.check_circle, size: 80, color: Colors.white),
          const SizedBox(height: 24),
          const Text(
            'Welcome Back!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(flex: 1),
          const SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }

  Widget _buildUnauthenticatedState() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          const Icon(Icons.person_off, size: 80, color: Colors.white),
          const SizedBox(height: 24),
          const Text(
            'Redirecting...',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(flex: 1),
          const SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}

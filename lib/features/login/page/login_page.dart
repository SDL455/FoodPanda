import 'package:flutter/material.dart';
import 'package:foodpanda/features/login/controller/login_controller.dart';
import 'package:foodpanda/features/login/widgets/login_background.dart';
import 'package:foodpanda/features/login/widgets/social_login_button.dart';
import 'package:get/get.dart';
import 'package:foodpanda/features/customer/views/customer_dashboard.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          LoginBackground(),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: size.height * 0.08),

                    // Brand / logo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.fastfood,
                            color: Colors.pinkAccent,
                            size: 36,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'FoodPanda',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    Text(
                      'Hungry? Get food delivered from your favourite restaurants.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),

                    const SizedBox(height: 36),

                    // Card container for auth options
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Sign in to continue',
                            style: TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 20),

                          SocialLoginButton(
                            label: 'Continue with Google',
                            kind: SocialLoginKind.google,
                            onPressed: () {
                              controller.singInwithGoogle();
                            },
                          ),

                          const SizedBox(height: 12),

                          SocialLoginButton(
                            label: 'Continue with Apple',
                            kind: SocialLoginKind.apple,
                            onPressed: () {
                              controller.signInWithApple();
                            },
                          ),

                          const SizedBox(height: 12),
                          SocialLoginButton(
                            label: 'Continue with Facebook',
                            kind: SocialLoginKind.facebook,
                            onPressed: () {
                              controller.signInWithFacebook();
                            },
                          ),

                          const SizedBox(height: 12),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.pinkAccent,
                              textStyle: TextStyle(fontSize: 16),
                            ),
                            onPressed: () {
                              // Continue as guest -> go to customer dashboard
                              Get.offAll(() => CustomerHome());
                            },
                            child: Text('Continue as Guest'),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: size.height * 0.08),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

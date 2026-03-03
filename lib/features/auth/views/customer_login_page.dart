import 'package:flutter/material.dart';
import 'package:foodpanda/features/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class CustomerLoginPage extends GetView<AuthController> {
  const CustomerLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Obx(() {
                final isLoading = controller.isLoading.value;
                final error = controller.lastError.value.trim();

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 56,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Sign in to continue',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Choose a sign-in method below.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (error.isNotEmpty) ...[
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.errorContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          error,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                    _SocialButton(
                      icon: Icons.g_mobiledata,
                      label: 'Continue with Google',
                      isLoading: isLoading,
                      onPressed: () async {
                        await controller.signInWithGoogle();
                        if (controller.isLoggedIn && context.mounted) {
                          Get.back();
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    _SocialButton(
                      icon: Icons.facebook,
                      label: 'Continue with Facebook',
                      isLoading: isLoading,
                      onPressed: () async {
                        await controller.signInWithFacebook();
                        if (controller.isLoggedIn && context.mounted) {
                          Get.back();
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    _SocialButton(
                      icon: Icons.apple,
                      label: 'Continue with Apple',
                      isLoading: isLoading,
                      onPressed: () async {
                        await controller.signInWithApple();
                        if (controller.isLoggedIn && context.mounted) {
                          Get.back();
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    if (isLoading) ...[
                      const Center(child: CircularProgressIndicator()),
                      const SizedBox(height: 12),
                    ],
                    Text(
                      'By continuing, you agree to our Terms & Privacy Policy.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color:
                            (theme.textTheme.bodySmall?.color ??
                                    theme.colorScheme.onSurface)
                                .withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isLoading;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}

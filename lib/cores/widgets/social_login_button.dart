import 'package:flutter/material.dart';

enum SocialLoginKind { google, apple, facebook }

class SocialLoginButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final SocialLoginKind kind;

  const SocialLoginButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.kind = SocialLoginKind.google,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isApple = kind == SocialLoginKind.apple;
    final bool isFacebook = kind == SocialLoginKind.facebook;

    if (isApple) {
      return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: Icon(Icons.apple, size: 20),
        label: Text(label, style: TextStyle(fontSize: 16)),
        onPressed: onPressed,
      );
    }

    if (isFacebook) {
      return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1877F2),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: Icon(Icons.facebook, size: 20),
        label: Text(label, style: TextStyle(fontSize: 16)),
        onPressed: onPressed,
      );
    }

    // Google style
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(vertical: 12),
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              'G',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 12),
          Text(label, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

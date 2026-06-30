import 'package:flutter/material.dart';

/// A notification bell icon with an optional red badge counter.
///
/// Used in Seller dashboard; now also added to Admin and Rider dashboards.
///
/// Usage:
/// ```dart
/// AppNotificationBadge(
///   count: 3,
///   onTap: () => Navigator.push(...),
/// )
/// ```
class AppNotificationBadge extends StatelessWidget {
  final int count;
  final VoidCallback? onTap;
  final Color iconColor;

  const AppNotificationBadge({
    Key? key,
    this.count = 0,
    this.onTap,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.notifications, color: iconColor),
          onPressed: onTap ?? () {},
          tooltip: 'ການແຈ້ງເຕືອນ',
        ),
        if (count > 0)
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
              child: Text(
                count > 99 ? '99+' : '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}

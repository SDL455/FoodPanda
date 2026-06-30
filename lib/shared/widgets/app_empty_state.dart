import 'package:flutter/material.dart';
import 'package:foodpanda/shared/app_theme.dart';

/// A full-screen empty-state widget shown when a list has no items.
///
/// Currently only Seller Orders has an empty state; this widget adds the
/// same polished experience to Customer Orders, Rider Orders, and Admin lists.
///
/// Usage:
/// ```dart
/// AppEmptyState(
///   icon: Icons.receipt_long,
///   message: 'ບໍ່ມີລາຍການອໍເດີໃນເວລານີ້',
/// )
/// AppEmptyState(
///   icon: Icons.search_off,
///   message: 'ບໍ່ພົບຜົນການຄົ້ນຫາ',
///   subMessage: 'ລອງໃຊ້ຄຳຄົ້ນຫາອື່ນ',
/// )
/// ```
class AppEmptyState extends StatelessWidget {
  final IconData icon;
  final String message;
  final String? subMessage;
  final Color? iconColor;

  const AppEmptyState({
    Key? key,
    required this.icon,
    required this.message,
    this.subMessage,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: (iconColor ?? Colors.grey).withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 56,
                color: (iconColor ?? Colors.grey).withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              style: AppTextStyles.body(color: Colors.grey.shade500)
                  .copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            if (subMessage != null) ...[
              const SizedBox(height: 8),
              Text(
                subMessage!,
                style: AppTextStyles.caption(color: Colors.grey.shade400),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

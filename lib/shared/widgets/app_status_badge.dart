import 'package:flutter/material.dart';
import 'package:foodpanda/shared/app_theme.dart';

/// A coloured pill-shaped badge used to display order / delivery statuses.
///
/// Replaces the inline `Container + BoxDecoration + Text` status chips
/// duplicated in Admin Orders, Customer Orders, Rider Orders, and Seller Orders.
///
/// Usage:
/// ```dart
/// AppStatusBadge(label: 'ຈັດສົ່ງສຳເລັດ', color: AppColors.statusDelivered),
/// AppStatusBadge.fromStatus('new'),   // auto-resolves colour & label
/// ```
class AppStatusBadge extends StatelessWidget {
  final String label;
  final Color color;

  const AppStatusBadge({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);

  /// Factory that accepts a raw status key and auto-resolves the Lao label
  /// and colour – keeping status semantics consistent across all roles.
  factory AppStatusBadge.fromStatus(String status) {
    late Color color;
    late String label;

    switch (status.toLowerCase()) {
      case 'new':
        color = AppColors.statusNew;
        label = 'ອໍເດີໃໝ່';
        break;
      case 'pending':
        color = AppColors.statusPending;
        label = 'ລໍຖ້າການຢືນຢັນ';
        break;
      case 'confirmed':
        color = AppColors.statusConfirmed;
        label = 'ຢືນຢັນແລ້ວ';
        break;
      case 'preparing':
        color = AppColors.statusPreparing;
        label = 'ກຳລັງປຸງແຕ່ງ';
        break;
      case 'ready':
        color = AppColors.statusReady;
        label = 'ພ້ອມສົ່ງ';
        break;
      case 'on_way':
      case 'onway':
      case 'delivering':
        color = AppColors.statusOnWay;
        label = 'ກຳລັງຈັດສົ່ງ';
        break;
      case 'delivered':
        color = AppColors.statusDelivered;
        label = 'ຈັດສົ່ງສຳເລັດ';
        break;
      case 'cancelled':
        color = AppColors.statusCancelled;
        label = 'ຍົກເລີກ';
        break;
      case 'online':
        color = AppColors.success;
        label = 'ອອນລາຍ';
        break;
      case 'offline':
        color = Colors.grey;
        label = 'ອັອຟລາຍ';
        break;
      default:
        color = Colors.grey;
        label = status;
    }

    return AppStatusBadge(label: label, color: color);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(AppDimens.badgeRadius),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

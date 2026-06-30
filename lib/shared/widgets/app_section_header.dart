import 'package:flutter/material.dart';
import 'package:foodpanda/shared/app_theme.dart';

/// A standardised section heading used throughout all role dashboards.
///
/// Usage:
/// ```dart
/// AppSectionHeader('ກິດຈະກຳຫຼ້າສຸດ'),
/// AppSectionHeader('ສະຫຼຸບລາຍງານມື້ນີ້', trailing: TextButton(...)),
/// ```
class AppSectionHeader extends StatelessWidget {
  final String title;

  /// Optional widget placed on the far right (e.g. a "ເບິ່ງທັງໝົດ" button).
  final Widget? trailing;

  /// Custom colour override for the title text.
  final Color? color;

  const AppSectionHeader(
    this.title, {
    Key? key,
    this.trailing,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleWidget = Text(
      title,
      style: AppTextStyles.sectionHeader(color: color),
    );

    if (trailing == null) return titleWidget;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: titleWidget),
        trailing!,
      ],
    );
  }
}

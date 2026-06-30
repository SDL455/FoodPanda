import 'package:flutter/material.dart';
import 'package:foodpanda/shared/app_theme.dart';
import 'package:foodpanda/shared/widgets/app_stats_card.dart';
import 'package:foodpanda/shared/widgets/app_section_header.dart';

class AdminOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ພາບລວມແດຊບອດ', style: AppTextStyles.pageTitle()),
          const SizedBox(height: 20),

          // ── Stats Row 1 ──────────────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: AppStatsCard(
                  title: 'ອໍເດີທັງໝົດ',
                  value: '1,234',
                  icon: Icons.receipt,
                  color: AppColors.admin,
                ),
              ),
              const SizedBox(width: AppDimens.cardGap),
              Expanded(
                child: AppStatsCard(
                  title: 'ຜູ້ຈັດສົ່ງທີ່ເຄື່ອນໄຫວ',
                  value: '89',
                  icon: Icons.delivery_dining,
                  color: AppColors.rider,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.cardGap),

          // ── Stats Row 2 ──────────────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: AppStatsCard(
                  title: 'ຮ້ານອາຫານ',
                  value: '456',
                  icon: Icons.restaurant,
                  color: AppColors.success,
                ),
              ),
              const SizedBox(width: AppDimens.cardGap),
              Expanded(
                child: AppStatsCard(
                  title: 'ລາຍຮັບ',
                  value: '12.5M ກີບ',
                  icon: Icons.attach_money,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.sectionSpacing),

          // ── Recent Activities ────────────────────────────────────────────
          const AppSectionHeader('ກິດຈະກຳຫຼ້າສຸດ'),
          const SizedBox(height: 12),

          Expanded(
            child: ListView(
              children: const [
                _ActivityTile(
                  title: 'ລົງທະບຽນຮ້ານອາຫານໃໝ່',
                  subtitle: 'ຮ້ານ Pizza Palace ໄດ້ເຂົ້າຮ່ວມແພລດຟອມ',
                  time: '2 ຊົ່ວໂມງກ່ອນ',
                  icon: Icons.restaurant,
                ),
                _ActivityTile(
                  title: 'ຜູ້ຈັດສົ່ງສຳເລັດການອົບຮົມ',
                  subtitle: 'John Doe ສຳເລັດການອົບຮົມຄວາມປອດໄພ',
                  time: '4 ຊົ່ວໂມງກ່ອນ',
                  icon: Icons.school,
                ),
                _ActivityTile(
                  title: 'ບຳລຸງຮັກສາລະບົບ',
                  subtitle: 'ອັບເດດລະບົບຊຳລະເງິນແລ້ວ',
                  time: '1 ວັນກ່ອນ',
                  icon: Icons.build,
                ),
                _ActivityTile(
                  title: 'ຜູ້ໃຊ້ໃໝ່ລົງທະບຽນ',
                  subtitle: 'ມີ 12 ຜູ້ໃຊ້ໃໝ່ລົງທະບຽນໃນວັນນີ້',
                  time: '5 ຊົ່ວໂມງກ່ອນ',
                  icon: Icons.person_add,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Private widget (local to this file only)
// ─────────────────────────────────────────────────────────────────────────────
class _ActivityTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;

  const _ActivityTile({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      shape: AppShapes.card,
      elevation: AppDimens.cardElevation,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.admin.withOpacity(0.1),
          child: Icon(icon, color: AppColors.admin),
        ),
        title: Text(title, style: AppTextStyles.cardTitle()),
        subtitle: Text(subtitle, style: AppTextStyles.caption()),
        trailing: Text(time, style: AppTextStyles.caption()),
      ),
    );
  }
}

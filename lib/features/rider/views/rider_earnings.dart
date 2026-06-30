import 'package:flutter/material.dart';
import 'package:foodpanda/shared/app_theme.dart';
import 'package:foodpanda/shared/widgets/app_section_header.dart';

class RiderEarnings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ລາຍໄດ້', style: AppTextStyles.pageTitle()),
            const SizedBox(height: 20),

            // ── Summary Cards ──────────────────────────────────────────────
            Row(
              children: [
                Expanded(child: _EarningsSummaryCard(label: 'ມື້ນີ້',    value: '85,000 ກີບ', color: AppColors.success)),
                const SizedBox(width: AppDimens.cardGap),
                Expanded(child: _EarningsSummaryCard(label: 'ອາທິດນີ້', value: '420,000 ກີບ', color: AppColors.rider)),
                const SizedBox(width: AppDimens.cardGap),
                Expanded(child: _EarningsSummaryCard(label: 'ເດືອນນີ້',  value: '1.8M ກີບ',   color: Colors.purple)),
              ],
            ),
            const SizedBox(height: 24),

            // ── History list ───────────────────────────────────────────────
            const AppSectionHeader('ປະຫວັດລາຍໄດ້ຫຼ້າສຸດ'),
            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 15,
                itemBuilder: (context, index) {
                  final amount = 12000 + index * 5000;
                  final formatted = amount.toString().replaceAllMapped(
                    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                    (m) => '${m[1]},',
                  );
                  final hour = (DateTime.now().subtract(Duration(hours: index)).hour)
                      .toString()
                      .padLeft(2, '0');

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.success.withOpacity(0.1),
                      child: const Icon(Icons.attach_money, color: AppColors.success),
                    ),
                    title: Text('ອໍເດີ #${1000 + index}', style: AppTextStyles.cardTitle()),
                    subtitle: Text('$hour:00 ນ.', style: AppTextStyles.caption()),
                    trailing: Text(
                      '$formatted ກີບ',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.success,
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Private summary card (local to this file) ──────────────────────────────
class _EarningsSummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _EarningsSummaryCard({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: AppShapes.card,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            const SizedBox(height: 4),
            Text(value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodpanda/shared/app_theme.dart';
import 'package:foodpanda/shared/widgets/app_stats_card.dart';
import 'package:foodpanda/shared/widgets/app_section_header.dart';
import 'package:foodpanda/shared/widgets/app_notification_badge.dart';

class RiderHome extends StatefulWidget {
  @override
  _RiderHomeState createState() => _RiderHomeState();
}

class _RiderHomeState extends State<RiderHome> {
  bool _isOnline = false;
  int _notificationCount = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(AppDimens.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ────────────────────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ສະບາຍດີ, ໄຮເດີ!',
                      style: AppTextStyles.pageTitle(
                        color: AppColors.rider,
                      ),
                    ),
                    Text(
                      'ພ້ອມທີ່ຈະເລີ່ມຈັດສົ່ງແລ້ວບໍ?',
                      style: AppTextStyles.body(),
                    ),
                  ],
                ),
                // NEW: Notification badge (consistent with Seller & Admin)
                AppNotificationBadge(
                  count: _notificationCount,
                  iconColor: AppColors.rider,
                  onTap: () => setState(() => _notificationCount = 0),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // ── Online / Offline Toggle ───────────────────────────────────
            GestureDetector(
              onTap: () => setState(() => _isOnline = !_isOnline),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimens.cardRadius),
                  gradient: LinearGradient(
                    colors: _isOnline
                        ? [Colors.green.shade600, Colors.teal.shade400]
                        : [Colors.grey.shade600, Colors.grey.shade400],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: (_isOnline ? Colors.green : Colors.grey).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.power_settings_new,
                      size: 52,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _isOnline ? 'ທ່ານກຳລັງອອນລາຍ' : 'ທ່ານກຳລັງອັອຟລາຍ',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      _isOnline ? 'ແຕະເພື່ອອັອຟລາຍ' : 'ແຕະເພື່ອອອນລາຍ',
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),

            // ── Today's Stats ─────────────────────────────────────────────
            const AppSectionHeader('ສະຫຼຸບລາຍງານມື້ນີ້'),
            const SizedBox(height: 12),

            // Using shared AppStatsCard (replaces old RiderStatsCard)
            Row(
              children: [
                Expanded(
                  child: AppStatsCard(
                    title: 'ງານທີ່ຈັດສົ່ງ',
                    value: '12',
                    icon: Icons.delivery_dining,
                    color: AppColors.admin,
                  ),
                ),
                const SizedBox(width: AppDimens.cardGap),
                Expanded(
                  child: AppStatsCard(
                    title: 'ລາຍໄດ້ມື້ນີ້',
                    value: '85K ກີບ',
                    icon: Icons.monetization_on_outlined,
                    color: AppColors.success,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimens.cardGap),
            Row(
              children: [
                Expanded(
                  child: AppStatsCard(
                    title: 'ຊົ່ວໂມງແລ່ນງານ',
                    value: '6.5 ຊມ',
                    icon: Icons.access_time,
                    color: AppColors.rider,
                  ),
                ),
                const SizedBox(width: AppDimens.cardGap),
                Expanded(
                  child: AppStatsCard(
                    title: 'ຄະແນນລວມ',
                    value: '4.8 ⭐',
                    icon: Icons.star_rounded,
                    color: Colors.amber.shade700,
                  ),
                ),
              ],
            ),

            // ── Quick Actions (Online only) ───────────────────────────────
            if (_isOnline) ...[
              const SizedBox(height: 24),
              const AppSectionHeader('ເມນູດ່ວນ'),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.location_on),
                      label: const Text('ເບິ່ງແຜນທີ່'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.rider,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: AppShapes.button as OutlinedBorder?,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppDimens.cardGap),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.help_outline),
                      label: const Text('ຊ່ວຍເຫຼືອ'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.rider,
                        side: const BorderSide(color: AppColors.rider),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: AppShapes.button as OutlinedBorder?,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

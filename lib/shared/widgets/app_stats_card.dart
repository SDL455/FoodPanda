import 'package:flutter/material.dart';
import 'package:foodpanda/shared/app_theme.dart';

/// A unified stats card used by Admin, Rider, and Seller dashboards.
///
/// Replaces:
///  - Admin   → `StatsCard`       in `admin_over_view.dart`
///  - Rider   → `RiderStatsCard`  in `rider_home.dart`
///  - Seller  → `_buildMetricCard` in `seller_home_tab.dart`
class AppStatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  /// Optional trend label shown below the value (e.g. "+12% ຈາກມື້ວານ").
  final String? trend;
  final Color? trendColor;

  const AppStatsCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.trend,
    this.trendColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppDimens.cardElevation,
      shape: AppShapes.card,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.cardPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon with coloured circle background
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 26, color: color),
            ),
            const SizedBox(height: 10),
            // Value
            Text(value, style: AppTextStyles.metricValue),
            const SizedBox(height: 4),
            // Label
            Text(
              title,
              style: AppTextStyles.caption(),
              textAlign: TextAlign.center,
            ),
            // Trend (optional)
            if (trend != null) ...[
              const SizedBox(height: 4),
              Text(
                trend!,
                style: AppTextStyles.caption(
                  color: trendColor ?? AppColors.success,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

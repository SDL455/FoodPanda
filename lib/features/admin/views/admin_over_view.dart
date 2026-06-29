import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';
import 'package:foodpanda/cores/themes/app_text_styles.dart';

class AdminOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final text = AppTextStyles.of(context);
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dashboard Overview', style: text.h2),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: StatsCard(
                  title: 'Total Orders',
                  value: '1,234',
                  icon: Icons.receipt,
                  color: AppColors.indigo,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: StatsCard(
                  title: 'Active Riders',
                  value: '89',
                  icon: Icons.delivery_dining,
                  color: AppColors.orangeGradient.colors.first,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: StatsCard(
                  title: 'Restaurants',
                  value: '456',
                  icon: Icons.restaurant,
                  color: AppColors.green,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: StatsCard(
                  title: 'Revenue',
                  value: '\$12.5K',
                  icon: Icons.attach_money,
                  color: AppColors.purpleGradient.colors.first,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Text('Recent Activities', style: text.h3),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView(
              children: [
                ActivityTile(
                  title: 'New restaurant registered',
                  subtitle: 'Pizza Palace joined the platform',
                  time: '2 hours ago',
                  icon: Icons.restaurant,
                ),
                ActivityTile(
                  title: 'Rider completed training',
                  subtitle: 'John Doe completed safety training',
                  time: '4 hours ago',
                  icon: Icons.school,
                ),
                ActivityTile(
                  title: 'System maintenance',
                  subtitle: 'Payment gateway updated',
                  time: '1 day ago',
                  icon: Icons.build,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatsCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyles.of(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
        boxShadow: [BoxShadow(color: AppColors.shadowLight, blurRadius: 12, offset: const Offset(0, 4))],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, size: 22.sp, color: color),
          ),
          SizedBox(height: 8.h),
          Text(value, style: text.h2.copyWith(color: AppColors.textDark)),
          Text(title, style: text.caption),
        ],
      ),
    );
  }
}

class ActivityTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final IconData icon;

  const ActivityTile({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyles.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
        boxShadow: [BoxShadow(color: AppColors.shadowLight, blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: AppColors.indigo.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, color: AppColors.indigo, size: 18.sp),
        ),
        title: Text(title, style: text.body1.copyWith(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: text.caption),
        trailing: Text(time, style: text.caption),
      ),
    );
  }
}

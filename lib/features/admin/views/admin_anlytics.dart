import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';
import 'package:foodpanda/cores/themes/app_text_styles.dart';

class AdminAnalytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final text = AppTextStyles.of(context);
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Analytics', style: text.h2),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView(
              children: [
                _buildChartCard(context, 'Order Trends', Icons.show_chart, AppColors.indigoGradient, 'Weekly order volume and revenue'),
                SizedBox(height: 12.h),
                _buildChartCard(context, 'Rider Performance', Icons.speed, AppColors.blueGradient, 'Delivery times and ratings'),
                SizedBox(height: 12.h),
                _buildChartCard(context, 'Revenue Analytics', Icons.trending_up, AppColors.purpleGradient, 'Monthly revenue breakdown'),
                SizedBox(height: 12.h),
                _buildChartCard(context, 'Restaurant Insights', Icons.pie_chart, AppColors.orangeGradient, 'Top restaurants and categories'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartCard(BuildContext context, String title, IconData icon, Gradient gradient, String subtitle) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(icon, color: AppColors.textWhite, size: 18.sp),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: text.body1.copyWith(fontWeight: FontWeight.w600)),
                  SizedBox(height: 2.h),
                  Text(subtitle, style: text.caption),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            height: 120.h,
            decoration: BoxDecoration(
              color: AppColors.shadowLight,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(7, (i) {
                  return Container(
                    width: 24.w,
                    height: 40.h + (i * 10.h) % 60,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

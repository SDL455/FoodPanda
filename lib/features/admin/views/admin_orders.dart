import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';
import 'package:foodpanda/cores/themes/app_text_styles.dart';

class AdminOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final text = AppTextStyles.of(context);
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Management', style: text.h2),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                List<String> statuses = [
                  'Pending',
                  'Confirmed',
                  'Preparing',
                  'On the way',
                  'Delivered',
                ];
                String status = statuses[index % statuses.length];
                Color statusColor = _getStatusColor(status);

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
                      width: 40.w,
                      height: 40.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        '#${1000 + index}',
                        style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w700, color: statusColor),
                      ),
                    ),
                    title: Text('Order #${1000 + index}', style: text.body1.copyWith(fontWeight: FontWeight.w600)),
                    subtitle: Text('Customer: John Doe  Restaurant: Pizza Palace', style: text.caption),
                    trailing: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: statusColor.withValues(alpha: 0.3)),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(color: statusColor, fontSize: 10.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return AppColors.yellow;
      case 'Confirmed':
        return AppColors.blue;
      case 'Preparing':
        return AppColors.purpleGradient.colors.first;
      case 'On the way':
        return AppColors.indigo;
      case 'Delivered':
        return AppColors.green;
      default:
        return AppColors.grey;
    }
  }
}

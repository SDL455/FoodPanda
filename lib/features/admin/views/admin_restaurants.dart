import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';
import 'package:foodpanda/cores/themes/app_text_styles.dart';

class AdminRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final text = AppTextStyles.of(context);
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Restaurants', style: text.h2),
              Container(
                decoration: BoxDecoration(
                  gradient: AppColors.indigoGradient,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [BoxShadow(color: AppColors.indigo.withValues(alpha: 0.4), blurRadius: 8, offset: const Offset(0, 4))],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.r),
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: AppColors.textWhite, size: 18.sp),
                          SizedBox(width: 6.w),
                          Text('Add Restaurant', style: TextStyle(color: AppColors.textWhite, fontSize: 13.sp, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
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
                      width: 44.w,
                      height: 44.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: const DecorationImage(
                          image: NetworkImage('https://via.placeholder.com/50'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text('Restaurant ${index + 1}', style: text.body1.copyWith(fontWeight: FontWeight.w600)),
                    subtitle: Text(
                      'Rating: 4.${index % 5 + 1}  Orders: ${100 + index * 10}',
                      style: text.caption,
                    ),
                    trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert, color: AppColors.textGrey, size: 20.sp),
                      itemBuilder: (context) => [
                        PopupMenuItem(child: Text('View Details', style: text.body2)),
                        PopupMenuItem(child: Text('Edit', style: text.body2)),
                        PopupMenuItem(child: Text('Suspend', style: text.body2.copyWith(color: AppColors.red))),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

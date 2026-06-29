import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';
import 'package:foodpanda/features/rider/controllers/rider_controller.dart';
import 'package:foodpanda/features/rider/views/rider_home.dart';
import 'package:foodpanda/features/rider/views/rider_orders.dart';
import 'package:foodpanda/features/rider/views/rider_earnings.dart';
import 'package:foodpanda/features/rider/views/rider_profile.dart';

class RiderDashboard extends StatelessWidget {
  final RiderController controller = Get.find<RiderController>();

  final List<Widget> _pages = [
    RiderHome(),
    RiderOrders(),
    RiderEarnings(),
    RiderProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[controller.selectedIndex]),
      bottomNavigationBar: Obx(() => Container(
        decoration: BoxDecoration(
          color: AppColors.glassWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          border: Border(
            top: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  isSelected: controller.selectedIndex == 0,
                  onTap: () => controller.changeTab(0),
                ),
                _NavItem(
                  icon: Icons.receipt_rounded,
                  label: 'Orders',
                  isSelected: controller.selectedIndex == 1,
                  onTap: () => controller.changeTab(1),
                ),
                _NavItem(
                  icon: Icons.attach_money_rounded,
                  label: 'Earnings',
                  isSelected: controller.selectedIndex == 2,
                  onTap: () => controller.changeTab(2),
                ),
                _NavItem(
                  icon: Icons.person_rounded,
                  label: 'Profile',
                  isSelected: controller.selectedIndex == 3,
                  onTap: () => controller.changeTab(3),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryGreen.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primaryGreen : AppColors.grey,
              size: 24.sp,
            ),
            SizedBox(height: 2.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                color: isSelected ? AppColors.primaryGreen : AppColors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

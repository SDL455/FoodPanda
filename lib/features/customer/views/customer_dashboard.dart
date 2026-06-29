import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';
import 'package:foodpanda/features/customer/controllers/customer_controller.dart';
import 'package:foodpanda/features/customer/views/customer_home_tab.dart';
import 'package:foodpanda/features/customer/views/customer_orders.dart';
import 'package:foodpanda/features/customer/views/customer_profile.dart';
import 'package:foodpanda/features/customer/views/customer_search.dart';

class CustomerHome extends StatelessWidget {
  final CustomerController controller = Get.find<CustomerController>();

  final List<Widget> _pages = [
    CustomerHomeTab(),
    CustomerSearch(),
    CustomerOrders(),
    CustomerProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[controller.selectedIndex]),
      bottomNavigationBar: Obx(() => _buildBottomNav()),
    );
  }

  Widget _buildBottomNav() {
    final items = [
      (icon: Icons.home, label: 'Home'),
      (icon: Icons.search, label: 'Search'),
      (icon: Icons.receipt, label: 'Orders'),
      (icon: Icons.person, label: 'Profile'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.glassWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.3))),
        boxShadow: [
          BoxShadow(color: AppColors.shadowStrong, blurRadius: 20, offset: const Offset(0, -4)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: controller.selectedIndex,
          onTap: (index) => controller.changeTab(index),
          selectedItemColor: AppColors.pink,
          unselectedItemColor: AppColors.textGrey,
          selectedFontSize: 12.sp,
          unselectedFontSize: 12.sp,
          items: items.map((item) {
            return BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            );
          }).toList(),
        ),
      ),
    );
  }
}

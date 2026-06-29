import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';
import 'package:foodpanda/cores/themes/app_text_styles.dart';
import 'package:foodpanda/features/admin/controllers/admin_controller.dart';
import 'package:foodpanda/features/admin/views/admin_anlytics.dart';
import 'package:foodpanda/features/admin/views/admin_orders.dart';
import 'package:foodpanda/features/admin/views/admin_over_view.dart';
import 'package:foodpanda/features/admin/views/admin_restaurants.dart';
import 'package:foodpanda/features/admin/views/admin_riders.dart';

class AdminDashboard extends StatelessWidget {
  final AdminController controller = Get.find<AdminController>();

  final List<Widget> _pages = [
    AdminOverview(),
    AdminRestaurants(),
    AdminRiders(),
    AdminOrders(),
    AdminAnalytics(),
  ];

  @override
  Widget build(BuildContext context) {
    final text = AppTextStyles.of(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('Admin Dashboard', style: text.h4.copyWith(color: AppColors.textWhite)),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(decoration: const BoxDecoration(gradient: AppColors.indigoGradient)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: AppColors.textWhite),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: AppColors.textWhite),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() => _pages[controller.selectedIndex]),
      bottomNavigationBar: Obx(() => Container(
        decoration: BoxDecoration(
          color: AppColors.glassWhite,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: 12, offset: const Offset(0, -4))],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.selectedIndex,
            onTap: (index) => controller.changeTab(index),
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: AppColors.indigo,
            unselectedItemColor: AppColors.textGrey,
            selectedFontSize: 11.sp,
            unselectedFontSize: 11.sp,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Overview'),
              BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Restaurants'),
              BottomNavigationBarItem(icon: Icon(Icons.delivery_dining), label: 'Riders'),
              BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
              BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
            ],
          ),
        ),
      )),
    );
  }
}

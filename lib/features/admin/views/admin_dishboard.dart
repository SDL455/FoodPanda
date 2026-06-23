import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
        ],
      ),
      body: Obx(() => _pages[controller.selectedIndex]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.selectedIndex,
        onTap: (index) => controller.changeTab(index),
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Restaurants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            label: 'Riders',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
        ],
      )),
    );
  }
}

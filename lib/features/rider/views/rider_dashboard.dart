import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foodpanda/features/rider/controllers/rider_controller.dart';
import 'package:foodpanda/features/rider/views/rider_earnings.dart';
import 'package:foodpanda/features/rider/views/rider_home.dart';
import 'package:foodpanda/features/rider/views/rider_orders.dart';
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
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.selectedIndex,
        onTap: (index) => controller.changeTab(index),
        selectedItemColor: Colors.orange,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      )),
    );
  }
}

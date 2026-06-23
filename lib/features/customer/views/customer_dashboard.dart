import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.selectedIndex,
        onTap: (index) => controller.changeTab(index),
        selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      )),
    );
  }
}

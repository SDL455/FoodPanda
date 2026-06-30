import 'package:flutter/material.dart';
import 'package:foodpanda/features/admin/views/admin_analytics.dart';
import 'package:foodpanda/features/admin/views/admin_orders.dart';
import 'package:foodpanda/features/admin/views/admin_over_view.dart';
import 'package:foodpanda/features/admin/views/admin_restaurants.dart';
import 'package:foodpanda/features/admin/views/admin_riders.dart';
import 'package:foodpanda/shared/app_theme.dart';
import 'package:foodpanda/shared/widgets/app_notification_badge.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;
  int _notificationCount = 5; // NEW: unread notification count

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
        title: const Text(
          'ລະບົບຄວບຄຸມ Admin',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: AppColors.admin,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          // ── NEW: Notification badge (consistent with Seller) ─────────────
          AppNotificationBadge(
            count: _notificationCount,
            onTap: () {
              setState(() => _notificationCount = 0);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('ການແຈ້ງເຕືອນ Admin'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: AppColors.admin,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'ພາບລວມ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_outlined),
            activeIcon: Icon(Icons.restaurant),
            label: 'ຮ້ານອາຫານ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining_outlined),
            activeIcon: Icon(Icons.delivery_dining),
            label: 'ໄຮເດີ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long),
            label: 'ອໍເດີ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            activeIcon: Icon(Icons.analytics),
            label: 'ສະຖິຕິ',
          ),
        ],
      ),
    );
  }
}

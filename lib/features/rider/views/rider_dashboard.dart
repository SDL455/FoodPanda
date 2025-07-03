import 'package:flutter/material.dart';
import 'package:foodpanda/features/rider/views/rider_earnings.dart';
import 'package:foodpanda/features/rider/views/rider_home.dart';
import 'package:foodpanda/features/rider/views/rider_orders.dart';
import 'package:foodpanda/features/rider/views/rider_profile.dart';

class RiderDashboard extends StatefulWidget {
  @override
  _RiderDashboardState createState() => _RiderDashboardState();
}

class _RiderDashboardState extends State<RiderDashboard> {
  int _selectedIndex = 0;
  // ignore: unused_field
  bool _isOnline = false;

  final List<Widget> _pages = [
    RiderHome(),
    RiderOrders(),
    RiderEarnings(),
    RiderProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
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
      ),
    );
  }
}

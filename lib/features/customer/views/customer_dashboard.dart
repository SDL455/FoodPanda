import 'package:flutter/material.dart';
import 'package:foodpanda/features/customer/views/customer_home_tab.dart';
import 'package:foodpanda/features/customer/views/customer_orders.dart';
import 'package:foodpanda/features/customer/views/customer_profile.dart';
import 'package:foodpanda/features/customer/views/customer_search.dart';

class CustomerHome extends StatefulWidget {
  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CustomerHomeTab(),
    CustomerSearch(),
    CustomerOrders(),
    CustomerProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'ໜ້າຫຼັກ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'ຄົ້ນຫາ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long),
            label: 'ອໍເດີ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'ໂປຣຟາຍ',
          ),
        ],
      ),
    );
  }
}

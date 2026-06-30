import 'package:flutter/material.dart';
import 'package:foodpanda/features/seller/views/seller_home_tab.dart';
import 'package:foodpanda/features/seller/views/seller_orders_tab.dart';
import 'package:foodpanda/features/seller/views/seller_store_info_tab.dart';
import 'package:foodpanda/features/seller/views/seller_reviews_tab.dart';
import 'package:foodpanda/features/seller/views/seller_notifications_screen.dart';
import 'package:foodpanda/features/seller/views/seller_menu_tab.dart';

class SellerDashboard extends StatefulWidget {
  @override
  _SellerDashboardState createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  int _selectedIndex = 0;
  bool _isStoreOpen = true; // Shared state for Open/Close status
  int _unreadNotificationsCount = 3;

  // Store information state (can be modified in Store Info and read elsewhere)
  Map<String, String> _storeInfo = {
    'name': 'ຕຳແຊບ ເມືອງລາວ',
    'category': 'ອາຫານລາວ, ສົ້ມຕຳ, ປິ້ງໄກ່',
    'rating': '4.8',
    'address': 'ຖະໜົນລ້ານຊ້າງ, ບ້ານຫັດສະດີ, ເມືອງຈັນທະບູລີ, ນະຄອນຫຼວງວຽງຈັນ',
    'phone': '+856 20 5555 1234',
    'hours': '09:00 - 21:00',
    'image': 'assets/images/restaurant_default.jpg', // Mock path
    'desc':
        'ຮ້ານອາຫານລາວດັ້ງເດີມ, ສົ້ມຕຳລົດເດັດ, ປິ້ງໄກ່ນາປົ່ງແຊບໆ ພ້ອມເສີບຄວາມແຊບໃຫ້ທຸກຄົນ.',
  };

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _updatePages();
  }

  void _updatePages() {
    _pages = [
      SellerHomeTab(
        isStoreOpen: _isStoreOpen,
        onStatusChanged: (status) {
          setState(() {
            _isStoreOpen = status;
            _updatePages();
          });
        },
      ),
      SellerOrdersTab(),
      SellerMenuTab(),
      SellerStoreInfoTab(
        storeInfo: _storeInfo,
        onSave: (updatedInfo) {
          setState(() {
            _storeInfo = updatedInfo;
            _updatePages();
          });
        },
      ),
      SellerReviewsTab(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _storeInfo['name']!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _isStoreOpen ? Colors.green : Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  _isStoreOpen ? 'ເປີດບໍລິການ (Open)' : 'ປິດບໍລິການ (Closed)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.pink,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SellerNotificationsScreen(
                        onClearAll: () {
                          setState(() {
                            _unreadNotificationsCount = 0;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              if (_unreadNotificationsCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text(
                      '$_unreadNotificationsCount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            tooltip: 'ອອກຈາກລະບົບ',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('ອອກຈາກລະບົບ'),
                  content: Text('ທ່ານຕ້ອງການອອກຈາກລະບົບຜູ້ຂາຍແທ້ຫຼືບໍ່?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'ຍົກເລີກ',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // close dialog
                        Navigator.pop(
                          context,
                        ); // pop dashboard to go back to login/roles selection
                      },
                      child: Text(
                        'ຕົກລົງ',
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'ໜ້າຫຼັກ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long),
            label: 'ອໍເດີ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu_outlined),
            activeIcon: Icon(Icons.restaurant_menu),
            label: 'ເມນູອາຫານ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_outlined),
            activeIcon: Icon(Icons.storefront),
            label: 'ຂໍ້ມູນຮ້ານ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline),
            activeIcon: Icon(Icons.star),
            label: 'ຄະແນນຮ້ານ',
          ),
        ],
      ),
    );
  }
}

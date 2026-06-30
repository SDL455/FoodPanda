import 'package:flutter/material.dart';

import 'package:foodpanda/features/admin/views/admin_dashboard.dart';
import 'package:foodpanda/features/admin/views/widget/role_card.dart';
import 'package:foodpanda/features/customer/views/customer_dashboard.dart';
import 'package:foodpanda/features/rider/views/rider_dashboard.dart';
import 'package:foodpanda/features/seller/views/seller_login.dart';

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pink.shade400, Colors.pink.shade700],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.restaurant, size: 70, color: Colors.white),
                      SizedBox(height: 12),
                      Text(
                        'Foodpanda',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Select Your Role',
                        style: TextStyle(fontSize: 18, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      RoleCard(
                        title: 'Admin',
                        subtitle: 'Manage platform operations',
                        icon: Icons.admin_panel_settings,
                        color: Colors.blue,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminDashboard(),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      RoleCard(
                        title: 'Customer',
                        subtitle: 'Order delicious food',
                        icon: Icons.person,
                        color: Colors.green,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomerHome(),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      RoleCard(
                        title: 'Rider',
                        subtitle: 'Deliver food to customers',
                        icon: Icons.delivery_dining,
                        color: Colors.orange,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RiderDashboard(),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      RoleCard(
                        title: 'Seller',
                        subtitle: 'Manage your restaurant and orders',
                        icon: Icons.storefront,
                        color: Colors.pink,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SellerLoginScreen(),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

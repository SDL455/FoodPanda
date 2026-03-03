import 'package:flutter/material.dart';
import 'package:foodpanda/cores/themes/themes.dart';

import 'package:foodpanda/features/admin/views/admin_dishboard.dart';
import 'package:foodpanda/features/admin/views/widget/relo_card.dart';
import 'package:foodpanda/features/customer/views/customer_dashboard.dart';
import 'package:foodpanda/features/rider/views/rider_dashboard.dart';

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.primaryGradient,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.restaurant,
                        size: 80,
                        color: AppColors.white,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Foodpanda',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        'Select Your Role',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      RoleCard(
                        title: 'Admin',
                        subtitle: 'Manage platform operations',
                        icon: Icons.admin_panel_settings,
                        color: AppColors.admin,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminDashboard(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      RoleCard(
                        title: 'Customer',
                        subtitle: 'Order delicious food',
                        icon: Icons.person,
                        color: AppColors.customer,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomerHome(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      RoleCard(
                        title: 'Rider',
                        subtitle: 'Deliver food to customers',
                        icon: Icons.delivery_dining,
                        color: AppColors.rider,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RiderDashboard(),
                          ),
                        ),
                      ),
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

import 'package:flutter/material.dart';
import 'package:foodpanda/features/rider/views/widgets/Profile_menu_item.dart';

class RiderProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/100'),
            ),
            SizedBox(height: 16),
            Text(
              'John Rider',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Rider ID: RID12345', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.orange, size: 20),
                Text(
                  ' 4.8 Rating',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  ProfileMenuItem(
                    icon: Icons.account_circle,
                    title: 'Personal Information',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.directions_bike,
                    title: 'Vehicle Information',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.assessment,
                    title: 'Performance',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.payment,
                    title: 'Payment Details',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.help,
                    title: 'Help & Support',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {},
                  ),
                  ProfileMenuItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

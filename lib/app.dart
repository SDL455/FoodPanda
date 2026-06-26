// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:foodpanda/routes/customer/customer_routes.dart';

// class RoleSelectionScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.pink.shade400, Colors.pink.shade700],
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.restaurant, size: 80, color: Colors.white),
//                       SizedBox(height: 20),
//                       Text(
//                         'Foodpanda',
//                         style: TextStyle(
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         'Select Your Role',
//                         style: TextStyle(fontSize: 18, color: Colors.white70),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Container(
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       RoleCard(
//                         title: 'Admin',
//                         subtitle: 'Manage platform operations',
//                         icon: Icons.admin_panel_settings,
//                         color: Colors.blue,
//                         onTap: () => Get.toNamed(Routes.adminDashboard),
//                       ),
//                       SizedBox(height: 20),
//                       RoleCard(
//                         title: 'Customer',
//                         subtitle: 'Order delicious food',
//                         icon: Icons.person,
//                         color: Colors.green,
//                         onTap: () => Get.toNamed(Routes.customerDashboard),
//                       ),
//                       SizedBox(height: 20),
//                       RoleCard(
//                         title: 'Rider',
//                         subtitle: 'Deliver food to customers',
//                         icon: Icons.delivery_dining,
//                         color: Colors.orange,
//                         onTap: () => Get.toNamed(Routes.riderDashboard),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RoleCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final IconData icon;
//   final Color color;
//   final VoidCallback onTap;

//   const RoleCard({
//     required this.title,
//     required this.subtitle,
//     required this.icon,
//     required this.color,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: color.withValues(alpha: 0.1),
//           child: Icon(icon, color: color),
//         ),
//         title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text(subtitle),
//         trailing: Icon(Icons.arrow_forward_ios, color: color),
//         onTap: onTap,
//       ),
//     );
//   }
// }

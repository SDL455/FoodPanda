import 'package:flutter/material.dart';
import 'package:foodpanda/app.dart';

void main() {
  runApp(FoodpandaApp());
}

class FoodpandaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodpanda',
      theme: ThemeData(primarySwatch: Colors.pink, fontFamily: 'Roboto'),
      home: RoleSelectionScreen(),
      // home: ProductDashboard(),
      // home: AdminDashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

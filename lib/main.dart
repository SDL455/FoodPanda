import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodpanda/cores/themes/themes.dart';
import 'package:foodpanda/features/auth/bindings/initial_binding.dart';
import 'package:foodpanda/features/customer/views/customer_dashboard.dart';
import 'package:foodpanda/firebase_options.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FoodpandaApp());
}

class FoodpandaApp extends StatelessWidget {
  const FoodpandaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Foodpanda',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialBinding: InitialBinding(),
      // home: RoleSelectionScreen(),
      // home: ProductDashboard(),
      // home: AdminDashboard(),
      home: CustomerHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

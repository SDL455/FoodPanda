import 'package:get/get.dart';
import 'package:foodpanda/app.dart';
import 'package:foodpanda/features/splash/views/splash_view.dart';
import 'package:foodpanda/features/admin/views/admin_dishboard.dart';
import 'package:foodpanda/features/customer/views/customer_dashboard.dart';
import 'package:foodpanda/features/rider/views/rider_dashboard.dart';
import 'package:foodpanda/bindings/app_bindings.dart';

class AppRoutes {
  static const String splash = '/';
  static const String roleSelection = '/role-selection';
  static const String adminDashboard = '/admin-dashboard';
  static const String customerDashboard = '/customer-dashboard';
  static const String riderDashboard = '/rider-dashboard';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: roleSelection,
      page: () => RoleSelectionScreen(),
    ),
    GetPage(
      name: adminDashboard,
      page: () => AdminDashboard(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: customerDashboard,
      page: () => CustomerHome(),
      binding: CustomerBinding(),
    ),
    GetPage(
      name: riderDashboard,
      page: () => RiderDashboard(),
      binding: RiderBinding(),
    ),
  ];
}

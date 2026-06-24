import 'package:foodpanda/app.dart';
import 'package:foodpanda/cores/bindings/app_bindings.dart';
import 'package:foodpanda/features/admin/views/admin_dishboard.dart';
import 'package:foodpanda/features/customer/views/customer_dashboard.dart';
import 'package:foodpanda/features/login/page/login_page.dart';
import 'package:foodpanda/features/rider/views/rider_dashboard.dart';
import 'package:foodpanda/features/splash/brindings/splash_brinding.dart';
import 'package:foodpanda/features/splash/views/splash_page.dart';
import 'package:foodpanda/routes/routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(name: Routes.login, page: () => LoginPage(), binding: AppBinding()),
    GetPage(
      name: Routes.roleSelection,
      page: () => RoleSelectionScreen(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.adminDashboard,
      page: () => AdminDashboard(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.customerDashboard,
      page: () => CustomerHome(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.riderDashboard,
      page: () => RiderDashboard(),
      binding: AppBinding(),
    ),
  ];
}

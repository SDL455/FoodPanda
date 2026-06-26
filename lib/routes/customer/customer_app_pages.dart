import 'package:foodpanda/cores/bindings/app_bindings.dart';
import 'package:foodpanda/features/admin/views/admin_dishboard.dart';
import 'package:foodpanda/features/customer/views/customer_dashboard.dart';
import 'package:foodpanda/features/login/brinding/login_ridder_brinding.dart';
import 'package:foodpanda/features/login/page/login_page.dart';
import 'package:foodpanda/features/login/page/login_ridder_page.dart';
import 'package:foodpanda/features/splash/brindings/splash_brinding.dart';
import 'package:foodpanda/features/splash/views/splash_page.dart';
import 'package:foodpanda/routes/customer/customer_routes.dart';
import 'package:get/get.dart';

abstract class CustomerAppPages {
  static final CustomerPages = [
    GetPage(
      name: CustomerRoutes.splashcustomer,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: CustomerRoutes.login,
      page: () => LoginPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: CustomerRoutes.loginRidder,
      page: () => LoginRidderPage(),
      binding: LoginRidderBrinding(),
    ),
    // GetPage(
    //   name: CustomerRoutes.roleSelection,
    //   page: () => RoleSelectionScreen(),
    //   binding: AppBinding(),
    // ),
    GetPage(
      name: CustomerRoutes.adminDashboard,
      page: () => AdminDashboard(),
      binding: AppBinding(),
    ),
    GetPage(
      name: CustomerRoutes.customerDashboard,
      page: () => CustomerHome(),
      binding: AppBinding(),
    ),
    // GetPage(
    //   name: CustomerRoutes.riderDashboard,
    //   page: () => RiderDashboard(),
    //   binding: AppBinding(),
    // ),
  ];
}

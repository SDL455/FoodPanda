import 'package:foodpanda/cores/bindings/app_bindings.dart';
import 'package:foodpanda/features/login/page/login_ridder_page.dart';
import 'package:foodpanda/features/splash/brindings/splash_ridder_brinding.dart';
import 'package:foodpanda/features/splash/views/splash_page_ridder.dart';
import 'package:foodpanda/routes/ridder/ridder_routes.dart';
import 'package:get/get.dart';

abstract class RidderAppPages {
  static final RidderPages = [
    GetPage(
      name: RidderRoutes.splashPageRidder,
      page: () => SplashPageRidder(),
      binding: SplashRidderBrinding(),
    ),
    GetPage(
      name: RidderRoutes.loginRidder,
      page: () => LoginRidderPage(),
      binding: RidderBinding(),
    ),
    // GetPage(
    //   name: RidderRoutes.riderDashboard,
    //   page: () => SplashPageRidder(),
    //   binding: SplashRidderBrinding(),
    // ),
  ];
}

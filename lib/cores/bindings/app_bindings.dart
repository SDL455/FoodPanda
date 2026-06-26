import 'package:foodpanda/cores/services/auth_service.dart';
import 'package:foodpanda/cores/services/connectivity_service.dart';
import 'package:foodpanda/features/admin/controllers/admin_controller.dart';
import 'package:foodpanda/features/customer/controllers/customer_controller.dart';
import 'package:foodpanda/features/login/controller/login_controller.dart';
import 'package:foodpanda/features/login/controller/login_ridder_controller.dart';
import 'package:foodpanda/features/splash/controllers/splash_controller.dart';
import 'package:foodpanda/features/splash/controllers/splash_ridder_controller.dart';
import 'package:get/get.dart';

// customer bindings
class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ConnectivityService(), permanent: true);
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AdminController>(() => AdminController());
    Get.lazyPut<CustomerController>(() => CustomerController());
    Get.put(AuthService(), permanent: true);
  }
}

// ridders bindings
class RidderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashRidderController>(() => SplashRidderController());
    Get.lazyPut<LoginRidderController>(() => LoginRidderController());
  }
}

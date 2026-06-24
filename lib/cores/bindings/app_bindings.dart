import 'package:foodpanda/features/admin/controllers/admin_controller.dart';
import 'package:foodpanda/features/customer/controllers/customer_controller.dart';
import 'package:foodpanda/features/login/controller/login_controller.dart';
import 'package:foodpanda/features/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AdminController>(() => AdminController());
    Get.lazyPut<CustomerController>(() => CustomerController());
  }
}

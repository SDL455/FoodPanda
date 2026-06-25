import 'package:foodpanda/cores/services/auth_service.dart';
import 'package:foodpanda/features/login/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthService>(AuthService());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

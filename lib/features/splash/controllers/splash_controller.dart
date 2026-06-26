import 'package:foodpanda/routes/customer/customer_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.offAllNamed(CustomerRoutes.customerDashboard);
      } else {
        Get.offAllNamed(CustomerRoutes.login);
      }
    });
  }
}

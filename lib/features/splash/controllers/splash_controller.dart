import 'package:foodpanda/routes/routes.dart';
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
    Future.delayed(const Duration(seconds: 2), () {
      // Get.offNamed(Routes.login);
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.offAllNamed(Routes.customerDashboard);
      } else {
        Get.offAllNamed(Routes.login);
      }
    });
  }
}

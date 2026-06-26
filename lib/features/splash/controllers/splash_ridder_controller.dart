import 'package:foodpanda/routes/ridder/ridder_routes.dart';
import 'package:get/get.dart';

class SplashRidderController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(RidderRoutes.loginRidder);
      // final user = FirebaseAuth.instance.currentUser;
      // if (user != null) {
      //   Get.offAllNamed(RidderRoutes.riderDashboard);
      // } else {
      //   Get.offAllNamed(RidderRoutes.loginRidder);
      // }
    });
  }
}

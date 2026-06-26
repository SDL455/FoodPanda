import 'package:foodpanda/features/splash/controllers/splash_ridder_controller.dart';
import 'package:get/get.dart';

class SplashRidderBrinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashRidderController>(SplashRidderController());
  }
}

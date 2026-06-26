import 'package:foodpanda/features/login/controller/login_ridder_controller.dart';
import 'package:get/get.dart';

class LoginRidderBrinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRidderController>(() => LoginRidderController());
  }
}

import 'package:get/get.dart';
import 'package:foodpanda/features/admin/controllers/admin_controller.dart';
import 'package:foodpanda/features/customer/controllers/customer_controller.dart';
import 'package:foodpanda/features/rider/controllers/rider_controller.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminController>(() => AdminController());
  }
}

class CustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerController>(() => CustomerController());
  }
}

class RiderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiderController>(() => RiderController());
  }
}

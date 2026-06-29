// import 'package:get/get.dart';

// class LoginRidderController extends GetxController {
//   final isLoading = false.obs;
// }
import 'package:flutter/material.dart';
import 'package:foodpanda/routes/ridder/ridder_routes.dart';
import 'package:get/get.dart';

class LoginRidderController extends GetxController {
  final phoneOrEmailController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordVisible = false.obs;
  final isRememberMe = false.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe(bool? value) {
    isRememberMe.value = value ?? false;
  }

  Future<void> login() async {
    if (phoneOrEmailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar(
        'ຂໍ້ຜິດພາດ',
        'ກະລຸນາໃສ່ຂໍ້ມູນໃຫ້ຄົບ',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    Get.snackbar(
      'ສຳເລັດ',
      'ເຂົ້າສູ່ລະບົບສຳເລັດ',
      backgroundColor: Colors.green.shade100,
      colorText: Colors.green,
      snackPosition: SnackPosition.TOP,
    );

    Get.offAllNamed(RidderRoutes.riderDashboard);
  }

  void loginWithGoogle() {
    Get.snackbar(
      'Google',
      'ກຳລັງເຊື່ອມຕໍ່ Google...',
      snackPosition: SnackPosition.TOP,
    );
  }

  void loginWithFacebook() {
    Get.snackbar(
      'Facebook',
      'ກຳລັງເຊື່ອມຕໍ່ Facebook...',
      snackPosition: SnackPosition.TOP,
    );
  }

  void loginWithApple() {
    Get.snackbar(
      'Apple',
      'ກຳລັງເຊື່ອມຕໍ່ Apple...',
      snackPosition: SnackPosition.TOP,
    );
  }

  void forgotPassword() {
    Get.snackbar(
      'ລືມລະຫັດ',
      'ໄປໜ້າລືມລະຫັດຜ່ານ...',
      snackPosition: SnackPosition.TOP,
    );
  }

  void registerNow() {
    Get.snackbar(
      'ລົງທະບຽນ',
      'ໄປໜ້າລົງທະບຽນ...',
      snackPosition: SnackPosition.TOP,
    );
  }

  @override
  void onClose() {
    phoneOrEmailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

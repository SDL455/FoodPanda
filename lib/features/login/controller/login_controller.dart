import 'package:flutter_login_facebook/flutter_login_facebook.dart'
    show FacebookLoginStatus;
import 'package:foodpanda/cores/services/auth_service.dart';
import 'package:foodpanda/routes/routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final AuthService _authService = Get.find<AuthService>();

  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;
      await _authService.signInWithGoogle();
      // Get.snackbar('Success', 'Google Sign-In successful');
      Get.offAllNamed(Routes.customerDashboard);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      isLoading.value = true;
      final result = await _authService.signInWithFacebook();

      if (result == null) return;

      switch (result.status) {
        case FacebookLoginStatus.success:
          final accessToken = result.accessToken;
          Get.snackbar(
            'Success',
            'Facebook Sign-In successful: ${accessToken?.userId}',
          );
          Get.offAllNamed(Routes.customerDashboard);
          break;
        case FacebookLoginStatus.cancel:
          Get.snackbar('Info', 'Facebook Sign-In cancelled by user.');
          break;
        case FacebookLoginStatus.error:
          Get.snackbar('Error', 'Facebook Sign-In error: ${result.error}');
          break;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void continueAsGuest() {
    Get.offAllNamed(Routes.customerDashboard);
  }

  Future<void> signInWithApple() async {
    try {
      isLoading.value = true;
      final credentials = await _authService.signInWithApple();

      Get.snackbar(
        'Success',
        'Apple Sign-In successful: ${credentials.userIdentifier}',
      );
      Get.snackbar('Info', 'Email: ${credentials.email}');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

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

      final userCredential = await _authService.signInWithFacebook();

      if (userCredential == null) {
        return;
      }

      Get.offAllNamed(Routes.customerDashboard);
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

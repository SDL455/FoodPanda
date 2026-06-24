import 'package:flutter_login_facebook/flutter_login_facebook.dart'
    show FacebookLogin, FacebookPermission, FacebookLoginStatus;
import 'package:foodpanda/routes/routes.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart' show GoogleSignIn;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();

  // Google Sign-In
  Future<void> singInwithGoogle() async {
    try {
      isLoading.value = true;
      final user = await _googleSignIn.authenticate();
      if (user != null) {
        // Handle successful sign-in
        Get.snackbar('Success', 'Google Sign-In successful');
        Get.offAllNamed(
          Routes.customerDashboard,
        ); // Navigate to the customer dashboard
        // print('Google Sign-In successful: ${user.displayName}');
        // print('Email: ${user.email}');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Facebook Sign-In
  Future<void> signInWithFacebook() async {
    try {
      isLoading.value = true;
      final result = await _facebookLogin.logIn(
        permissions: [
          FacebookPermission.publicProfile,
          FacebookPermission.email,
        ],
      );

      switch (result.status) {
        case FacebookLoginStatus.success:
          final accessToken = result.accessToken;
          Get.snackbar(
            'Success',
            'Facebook Sign-In successful: ${accessToken?.userId}',
          );
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

  //apple sign in
  Future<void> signInWithApple() async {
    try {
      isLoading.value = true;
      // Implement your Apple sign-in logic here
      final credentials = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

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

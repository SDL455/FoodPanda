import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:foodpanda/routes/app_routes.dart';

enum SplashStatus { checking, authenticated, unauthenticated }

class SplashController extends GetxController {
  final _status = SplashStatus.checking.obs;
  final _box = GetStorage();

  SplashStatus get status => _status.value;

  @override
  void onInit() {
    super.onInit();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    final role = _box.read<String>('userRole');

    if (role != null && role.isNotEmpty) {
      _status.value = SplashStatus.authenticated;
      _navigateByRole(role);
    } else {
      _status.value = SplashStatus.unauthenticated;
      Get.offNamed(AppRoutes.roleSelection);
    }
  }

  void _navigateByRole(String role) {
    switch (role) {
      case 'admin':
        Get.offNamed(AppRoutes.adminDashboard);
        break;
      case 'customer':
        Get.offNamed(AppRoutes.customerDashboard);
        break;
      case 'rider':
        Get.offNamed(AppRoutes.riderDashboard);
        break;
      default:
        Get.offNamed(AppRoutes.roleSelection);
    }
  }
}

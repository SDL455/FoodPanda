import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:foodpanda/cores/themes/app_colors.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  final Connectivity _connectivity = Connectivity();

  /// Current internet status
  final RxBool isConnected = true.obs;

  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  void onInit() {
    super.onInit();

    _checkConnection();

    _subscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  /// Check internet immediately when app starts
  Future<void> _checkConnection() async {
    final results = await _connectivity.checkConnectivity();
    _updateConnectionStatus(results);
  }

  /// Listen for connectivity changes
  void _updateConnectionStatus(List<ConnectivityResult> results) {
    final connected = results.any(
      (result) => result != ConnectivityResult.none,
    );

    // Prevent duplicate events
    if (connected == isConnected.value) {
      return;
    }

    isConnected.value = connected;

    if (connected) {
      print("✅ Internet Connected");

      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }

      Get.snackbar(
        "Connected",
        "Internet connection restored.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.Green,
        colorText: AppColors.divider,
        duration: const Duration(seconds: 2),
      );
    } else {
      print("❌ No Internet");

      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          "No Internet",
          "Please check your internet connection.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.Red,
          colorText: AppColors.divider,
          duration: const Duration(seconds: 3),
        );
      }
    }
  }

  /// Check internet before API/Login
  Future<bool> hasConnection() async {
    final results = await _connectivity.checkConnectivity();

    return results.any((result) => result != ConnectivityResult.none);
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }
}

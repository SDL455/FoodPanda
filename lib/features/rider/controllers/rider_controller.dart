import 'package:get/get.dart';

class RiderController extends GetxController {
  final _selectedIndex = 0.obs;
  final _isOnline = false.obs;

  int get selectedIndex => _selectedIndex.value;
  bool get isOnline => _isOnline.value;

  void changeTab(int index) => _selectedIndex.value = index;
  void toggleOnline() => _isOnline.value = !_isOnline.value;
}

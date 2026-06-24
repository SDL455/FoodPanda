import 'package:flutter/material.dart';
import 'package:foodpanda/features/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

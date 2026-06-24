import 'package:flutter/material.dart';
import 'package:foodpanda/cores/bindings/app_bindings.dart';
import 'package:foodpanda/routes/app_pages.dart';
import 'package:foodpanda/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      defaultTransition: Transition.fade,
      initialBinding: AppBinding(),
      getPages: AppPages.pages,
    ),
  );
}

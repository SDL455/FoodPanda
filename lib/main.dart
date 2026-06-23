import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foodpanda/routes/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Foodpanda',
      theme: ThemeData(primarySwatch: Colors.pink, fontFamily: 'Roboto'),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}

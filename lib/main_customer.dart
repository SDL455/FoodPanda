import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodpanda/cores/config/app_config.dart';
import 'package:foodpanda/features/splash/brindings/splash_ridder_brinding.dart';
import 'package:foodpanda/firebase_options.dart';
import 'package:foodpanda/routes/customer/customer_app_pages.dart';
import 'package:foodpanda/routes/customer/customer_routes.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize(
    serverClientId: AppConfig.googleServerClientId,
  );
  runApp(
    ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'customer App',
          debugShowCheckedModeBanner: false,
          initialRoute: CustomerRoutes.splashcustomer,
          defaultTransition: Transition.fade,
          initialBinding: SplashRidderBrinding(),
          getPages: CustomerAppPages.CustomerPages,
        );
      },
    ),
  );
}

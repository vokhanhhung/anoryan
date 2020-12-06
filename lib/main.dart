import 'package:anoryan/app/modules/login/bindings/login_binding.dart';
import 'package:anoryan/app/untils/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/modules/home/bindings/home_binding.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIOverlays([]);
  await Firebase.initializeApp();
  DependencyInjection.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      initialBinding: HomeBinding(),
      getPages: AppPages.routes,
    ),
  );
}

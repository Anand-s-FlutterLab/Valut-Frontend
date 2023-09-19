import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault/routes/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:AppRoutes.splashScreen,
      getPages: AppRoutes.pages,
    ),
  );
}


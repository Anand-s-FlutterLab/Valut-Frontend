import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vault/Widgets/snackbar.dart';
import '../../../constants/error_handler.dart';
import '../../../routes/app_routes.dart';

import '../../../constants/globals.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController()
    ..text = "Anand Patel";
  TextEditingController passwordController = TextEditingController()
    ..text = "!z%C*F-JaNdRgUkXn2r5u8x/A?D(G+Kb";
  TextEditingController ipController = TextEditingController()
    ..text = ipAddress.value;
  TextEditingController portController = TextEditingController()
    ..text = port.value;
  RxBool obscureText = true.obs;
  RxBool isLoginButtonTapped = false.obs;

  Future<void> getData() async {
    final data = jsonEncode({"pass": passwordController.text});
    try {
      final response = await dio.post(
        "http://${ipAddress.value}:${port.value}/$loginPath",
        data: data,
      );

      if (response.statusCode == 200) {
        if (response.data["status"] == "Valid Key") {
          password.value = passwordController.text;
          userName.value = usernameController.text;
          Get.offNamed(AppRoutes.homeScreen);
        }
      }
    } on DioError catch (e) {
      isLoginButtonTapped.value = false;
      ErrorHandler.handleError(e);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  void setIP() {
    ipAddress.value = ipController.text;
    port.value = portController.text;
    ipAddress.refresh();
    port.refresh();
    customSnackBar("IP Changed Successfully",
        "Your new IP is ${ipAddress.value}:${port.value}", true);
  }
}

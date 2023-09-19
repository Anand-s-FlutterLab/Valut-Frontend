import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/snackbar.dart';
import '../../../constants/error_handler.dart';
import '../../../constants/globals.dart';

class AddKeysController extends GetxController {
  TextEditingController categoryController = TextEditingController()
    ..text = "testing";
  TextEditingController passwordController = TextEditingController()
    ..text = "this is for testing";
  RxBool isSubmitTapped = false.obs;

  Future<void> setData() async {
    final data = jsonEncode({
      "plain_text":
          "${categoryController.text + "," + "${passwordController.text}"}",
    });
    try {
      final request =
          await dio.post("http://${ipAddress.value}:${port.value}/$addKeyPath", data: data);
      if (request.statusCode == 200) {
        customSnackBar("Key Added Successfully",
            "You have total ${request.data["status"]} keys", true);
      }
      isSubmitTapped.value = false;
    } on DioError catch (e) {
      isSubmitTapped.value = false;
      ErrorHandler.handleError(e);
    } catch (e) {
      isSubmitTapped.value = false;
      print("Error: $e");
    }
  }
}

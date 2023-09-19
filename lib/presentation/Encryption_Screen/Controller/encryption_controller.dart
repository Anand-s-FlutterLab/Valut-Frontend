import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault/Widgets/snackbar.dart';

import '../../../constants/error_handler.dart';
import '../../../constants/globals.dart';

class EncryptionController extends GetxController {
  TextEditingController messageController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  RxString selectedPassword = "".obs;
  RxBool keyFetched = false.obs;
  RxMap<String, dynamic> nameAndKeys = <String, dynamic>{}.obs;
  RxString selectedKey = "Banking".obs;
  RxBool isSubmitTapped = false.obs;

  @override
  void onInit() {
    super.onInit();
    getKeys();
  }

  Future<void> getKeys() async {
    try {
      keyFetched.value = false;
      final response = await dio.get("http://${ipAddress.value}:${port.value}/$viewKeysPath");

      if (response.statusCode == 200) {
        nameAndKeys.value = response.data["status"];
        keyFetched.value = true;
        selectedPassword.value = nameAndKeys[selectedKey.value];
        selectedPassword.refresh();
      }
    } on DioError catch (e) {
      ErrorHandler.handleError(e);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> setData() async {
    final data = jsonEncode({
      "plain_text": messageController.text,
      "password": selectedPassword.value,
      "category": categoryController.text
    });
    try {
      final request =
          await dio.post("http://${ipAddress.value}:${port.value}/$encryptionPath", data: data);
      if (request.statusCode == 200) {
        customSnackBar("Data Added Successfully",
            "You have total ${request.data["status"]} entries", true);
      }
      isSubmitTapped.value = false;

    } on DioError catch (e) {
      isSubmitTapped.value = false;
      ErrorHandler.handleError(e);
    } catch (e) {
      isSubmitTapped.value = false;
      debugPrint("Error: $e");
    }
  }
}

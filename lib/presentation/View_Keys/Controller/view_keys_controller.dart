import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault/Widgets/snackbar.dart';

import '../../../constants/error_handler.dart';
import '../../../constants/globals.dart';

class ViewKeysController extends GetxController {
  RxMap nameAndKeys = {}.obs;
  RxBool dataFetched = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    try {
      final response = await Dio().get(
        "http://${ipAddress.value}:${port.value}/$viewKeysPath",
      );

      if (response.statusCode == 200) {
        nameAndKeys.value = response.data["status"];
        dataFetched.value = true;
      }
    } on DioError catch (e) {
      ErrorHandler.handleError(e);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> deleteData(String deleteKey) async {
    try {
      final data = jsonEncode({
        "delete_key": deleteKey,
      });
      final response = await Dio().delete(
          "http://${ipAddress.value}:${port.value}/$deleteKeyPath",
          data: data);

      if (response.statusCode == 200) {
        customSnackBar("Success", "Key Deleted Successfully");
        getData();
      }
    } on DioError catch (e) {
      ErrorHandler.handleError(e);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}

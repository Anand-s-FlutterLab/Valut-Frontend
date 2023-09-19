import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault/Widgets/snackbar.dart';
import '../../../constants/error_handler.dart';
import '../../../constants/globals.dart';

class DecryptionController extends GetxController {
  RxMap<String, dynamic> nameAndKeys = <String, dynamic>{}.obs;
  RxString selectedKey = "Banking".obs;
  RxBool keyFetched = false.obs;
  RxBool dataFetched = false.obs;
  RxMap nameAndData = {}.obs;

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
        getData(nameAndKeys[selectedKey.value]);
      }
    } on DioError catch (e) {
      ErrorHandler.handleError(e);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> getData(String selectedPassword) async {
    try {
      dataFetched.value = false;
      final response = await Dio().get(
          "http://${ipAddress.value}:${port.value}/$decryptionPath",
          data: {"pass": selectedPassword});

      if (response.statusCode == 200) {
        nameAndData.value = response.data["status"];
        dataFetched.value = true;
      }
    } on DioError catch (e) {
      ErrorHandler.handleError(e);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> deleteData(String selectedData) async {
    try {
      final response = await Dio().delete(
          "http://${ipAddress.value}:${port.value}/$deleteDataPath",
          data: {"delete_data": selectedData});

      if (response.statusCode == 200) {
        customSnackBar("Deleted", "Data is successfully deleted", true);
        getData(nameAndKeys[selectedKey.value]);
      }
    } on DioError catch (e) {
      ErrorHandler.handleError(e);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}

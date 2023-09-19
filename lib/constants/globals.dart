import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxString ipAddress = "192.168.153.217".obs;
RxString port = "5000".obs;
RxString userName = "".obs;
RxString password = "".obs;

Color primaryColor = const Color.fromRGBO(143, 148, 251, 1);
Color primaryShading = const Color.fromRGBO(97, 101, 173, 1);

Size size = WidgetsBinding.instance.window.physicalSize /
    WidgetsBinding.instance.window.devicePixelRatio;

/// This method is used to get device viewport width.
get width {
  return size.width;
}

/// This method is used to get device viewport height.
get height {
  num statusBar =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).viewPadding.top;
  num screenHeight = size.height - statusBar;
  return screenHeight;
}

/// paths
String loginPath = "getloginpassword";
String encryptionPath = "encrypt";
String decryptionPath = "decrypt";
String viewKeysPath = "decrypt_keys";
String addKeyPath = "encrypt_key";
String deleteKeyPath = "delete_key";
String deleteDataPath = "delete_data";

/// Dio
final dio = Dio(
  BaseOptions(
    connectTimeout: const Duration(seconds: 5),
  ),
);

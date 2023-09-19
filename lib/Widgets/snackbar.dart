import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vault/constants/globals.dart';

SnackbarController customSnackBar(String title, String subtitle,
    [bool colorPicker = false]) {
  Color color = colorPicker ? Colors.green : Colors.red;
  return Get.snackbar(
    title,
    subtitle,
    titleText: Text(
      title,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    ),
    messageText: Text(
      subtitle,
      style: TextStyle(
        fontSize: 15.0,
        color: color,
        fontStyle: FontStyle.italic,
      ),
    ),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: color.withOpacity(0.2),
    barBlur: 10.0,
    borderRadius: 20,
    margin: EdgeInsets.all(15),
    colorText: color,
    overlayBlur: 1.5,
    duration: Duration(seconds: 3),
    forwardAnimationCurve: Curves.decelerate,
  );
}

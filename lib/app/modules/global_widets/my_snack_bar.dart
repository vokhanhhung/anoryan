import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorSnackBar(String error) async {
  Get.snackbar(
    'Error',
    error,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.red,
    backgroundColor: Colors.white,
  );
  await Future.delayed(Duration(seconds: 2));
}

void showSuccessSnackBar(String message) async {
  Get.snackbar(
    'Success',
    message,
    snackPosition: SnackPosition.BOTTOM,
    colorText: Colors.blue,
    backgroundColor: Colors.white,
  );
  await Future.delayed(Duration(seconds: 2));
}

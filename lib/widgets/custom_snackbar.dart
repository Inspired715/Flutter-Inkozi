import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkozi/UTILIS/colors.dart';

void showCustomSnackBar(String message, {bool isError = true}) {
  if (message.isNotEmpty) {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: isError ? Colors.red : primaryColor,
      message: message,
      maxWidth: double.maxFinite,
      duration: Duration(seconds: 4),
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.all(15),
      borderRadius: 10,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    ));
  }
}

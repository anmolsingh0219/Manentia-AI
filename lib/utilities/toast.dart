import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Toast {
  static showToast(bool isSuccess, String message) {
    GetBar(
      backgroundColor: AppColors.blackColor,
      borderRadius: 8,
      message: message,
      duration: Duration(seconds: 3),
      animationDuration: Duration(milliseconds: 300),
      icon: isSuccess
          ? Icon(Icons.check_circle_rounded, color: AppColors.greenColor)
          : Icon(Icons.error_rounded, color: AppColors.redColor),
      snackStyle: SnackStyle.FLOATING,
    )..show();
  }
}

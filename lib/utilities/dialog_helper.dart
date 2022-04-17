import 'package:app/controllers/auth_controller/auth_controller.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static showSignoutDialog(String message) {
    Get.defaultDialog(
      barrierDismissible: false,
      title: 'Error',
      titleStyle: Get.textTheme.bodyText1,
      middleText: message,
      middleTextStyle: Get.textTheme.bodyText1,
      cancel: SizedBox(),
      textConfirm: 'Okay',
      confirmTextColor: AppColors.whiteColor,
      onConfirm: () {
        Get.find<AuthController>().signOut();
      },
      onWillPop: () async {
        return false;
      },
      backgroundColor: Get.theme.scaffoldBackgroundColor,
    );
  }

  static Future<bool> showPopConfirmationDialog() async {
    bool goBack = false;
    await Get.defaultDialog(
      title: 'Confirmation',
      titleStyle: Get.textTheme.bodyText2,
      middleText: 'Are you sure you want to go back?',
      middleTextStyle: Get.textTheme.bodyText1,
      textCancel: 'No',
      textConfirm: 'Yes',
      confirmTextColor: AppColors.greyTextColor,
      cancelTextColor: Get.theme.accentColor,
      onConfirm: () {
        goBack = true;
        Get.back(closeOverlays: true);
      },
      backgroundColor: AppColors.neuBackgroundColor,
    );
    return goBack;
  }
}

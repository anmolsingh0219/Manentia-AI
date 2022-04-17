import 'package:app/utilities/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  ThemeMode mode = ThemeMode.dark;

  @override
  void onInit() {
    super.onInit();
    // mode = SharedPrefs().isDarkMode ? ThemeMode.dark : ThemeMode.light;
    update();
  }

  changIsDarkMode(ThemeMode value) {
    Get.changeThemeMode(value);
    mode = value;
    SharedPrefs().isDarkMode = value == ThemeMode.dark;
    update();
  }
}

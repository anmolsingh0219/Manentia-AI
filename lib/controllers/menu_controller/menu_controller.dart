import 'package:app/controllers/auth_controller/auth_controller.dart';
import 'package:app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:app/screens/products_screen/products_screen.dart';
import 'package:app/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  Widget currentScreen = ProductsScreen();
  int currentIndex = 0;
  String title = 'Products';

  changeScreen(int index) {
    if (index == 0) {
      currentScreen = ProductsScreen();
      title = 'Products';
    }
    if (index == 1) {
        currentScreen = DashboardScreen();
    }
    if (index == 2) {
      title = 'Settings';
      currentScreen = SettingsScreen();
    }
    if (index == 3) {
      Get.find<AuthController>().signOut();
    }
    currentIndex = index;
    update();
  }
}

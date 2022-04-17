import 'dart:io';
import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FCMController {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static getPermission() async {
    if (!Platform.isAndroid) {
      await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }
  }

  static foregroundInit() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        defaultDialog(message);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Got a message when tapped on notification');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        defaultDialog(message);
      }
    });
  }

  static Future defaultDialog(RemoteMessage message) {
    return Get.defaultDialog(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      title: message.notification.title,
      titleStyle: TextStyles.white18Bold,
      middleText: message.notification.body,
      middleTextStyle: Get.textTheme.bodyText1,
      textConfirm: 'Okay',
      confirmTextColor: AppColors.whiteColor,
    );
  }
}

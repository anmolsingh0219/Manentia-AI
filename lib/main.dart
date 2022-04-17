import 'package:app/utilities/log.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller/auth_controller.dart';
import 'controllers/auth_controller/google_sign_in_controller.dart';
import 'controllers/fcm_controller/fcm_controller.dart';
import 'controllers/menu_controller/menu_controller.dart';
import 'routing/route_generator.dart';
import 'routing/routes.dart';
import 'theme/theme_controller.dart';
import 'theme/themes.dart';
import 'utilities/shared_prefs.dart';
import 'dart:io';

//This is used as SSL is not installed. Remove after SSL is installed on the server.
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  HttpOverrides.global =
      new MyHttpOverrides(); //This is used as SSL is not installed. Remove after SSL is installed on the server.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //Initializing Firebase
  await SharedPrefs().init(); //Initializing Shared Preferences
  //FCM Configuration ------------------------------------------------------
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FCMController.getPermission();
  await FCMController.foregroundInit();
  //------------------------------------------------------------------------
  Log.isDevMode =
      true; //Change this to false in Production Mode to stop printing logs.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  //Initialize AuthController
  final authController = Get.put(AuthController());
  //Initialize GoogleSignInController
  final googleSignInController = Get.put(GoogleSignInController());
  //Initialize DrawerController
  final controller = Get.put(MenuController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (controller) {
        return GetMaterialApp(
          title: 'Manentiaadvisory',
          popGesture: false,
          debugShowCheckedModeBanner: false,
          theme: Themes
              .darkTheme, // TODO: Change this to light when light theme is implemented,
          darkTheme: Themes.darkTheme,
          themeMode: controller.mode,
          initialRoute: Routes.splashScreen,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}

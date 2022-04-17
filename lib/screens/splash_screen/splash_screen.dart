import 'package:app/api/api.dart';
import 'package:app/routing/routes.dart';
import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/assets.dart';
import 'package:app/utilities/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() async {
    await Future.delayed(Duration(milliseconds: 3500));
    if (SharedPrefs().firstLaunchDone) {
      if (SharedPrefs().apiEndPoint != '') {
        API.dio.options.baseUrl = SharedPrefs().apiEndPoint;
      }
      Get.offAllNamed(SharedPrefs().authToken != ''
          ? Routes.baseScreen
          : Routes.loginScreen);
    } else {
      Get.offAllNamed(Routes.introScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          Spacer(),
          Image.asset(Assets.logoAnimationGif),
          Spacer(),
          Text('www.manentiaadvisory.com', style: TextStyles.white18Bold),
          SizedBox(height: 40),
        ],
      ),
      // body: FlareActor(Assets.logoAnimation,
      //     alignment: Alignment.center, fit: BoxFit.cover, animation: 'logo'),
    );
  }
}

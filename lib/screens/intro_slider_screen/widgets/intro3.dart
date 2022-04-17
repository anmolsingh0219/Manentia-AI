import 'package:app/screens/intro_slider_screen/widgets/terms_dialog.dart';
import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Intro3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: AppColors.lightYellowColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.ratinoscanSvg, height: 100),
          Text('iCare', style: TextStyles.black24Bold),
          Text(
              'Focuses on Micro aneurysms, Hemorrhages, Exudates and generates various screening images from a single result imaging.',
              textAlign: TextAlign.center,
              style: TextStyles.black14),
          SizedBox(height: 20),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: AppColors.whiteColor,
                elevation: 2,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
            onPressed: () {
              Get.dialog(TermsDialog());
            },
            child: Text('Get Started', style: TextStyles.black14),
          ),
        ],
      ),
    );
  }
}

import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/assets.dart';
import 'package:flutter/material.dart';

class Intro2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: AppColors.lightPinkColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.rayscanBig,
            height: 100,
          ),
          Text('AI Diagnosis', style: TextStyles.black24Bold),
          Text(
              'An Ai-based virtual scanner developed to detect Respiratory and Lung diseases using X-ray and CT-Scan Images for Precise and Easy Analysis.',
              textAlign: TextAlign.center,
              style: TextStyles.black14),
        ],
      ),
    );
  }
}

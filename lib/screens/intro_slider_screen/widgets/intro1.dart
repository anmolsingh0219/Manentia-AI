import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/assets.dart';
import 'package:flutter/material.dart';

class Intro1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: AppColors.whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.logo,
            height: 150,
          ),
          Text('Manentia Advisory', style: TextStyles.black24Bold),
          Text(
              'We aim to aid Doctors and Paramedics with a seamless diagnostic process for Rapid and Accurate results.',
              textAlign: TextAlign.center,
              style: TextStyles.black14),
        ],
      ),
    );
  }
}

import 'package:app/components/neu_icon_button.dart';
import 'package:app/routing/routes.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/connectivity_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/sub_product_card.dart';

class RatinoscanSubProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: Get.theme.iconTheme,
          centerTitle: true,
          title: Hero(
            tag: 'ratino-scan',
            child: Text(
              'iCare',
              style: Get.textTheme.headline6,
            ),
          ),
          leading: NeuIconButton(
              child: Icon(Icons.arrow_back_rounded,
                  color: AppColors.greyTextColor, size: 20),
              radius: 50,
              onTap: () {
                Get.back();
              }),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            gradient: AppColors.blackBackgroundGradient,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 70),
                SubProductCard(
                  heading: 'Diabetic RatinoPathy (DR)',
                  description: 'Diabetic Ratinopathy Platform Which Can Detects The Symptoms Of Diabetes Retinopathy Using Fundus Image And Shows Area Effected By Microaneurysms, Hemorrhages & Exudates',
                  onTap: () async {
                    bool isConnected =
                        await ConnectivityHelper.checkConnection();
                    if (!isConnected) return;
                    Get.toNamed(Routes.ratinoscanFormScreen);
                  },
                ),
                SizedBox(height: 30),
                SubProductCard(
                  heading: 'Glucoma Detection',
                  description: 'Using monoscopic fundus photos, we have developed a deep learning–based algorithm to detect glaucomatous optic discs.',
                  onTap: () async {
                    bool isConnected =
                        await ConnectivityHelper.checkConnection();
                    if (!isConnected) return;
                    Get.toNamed(Routes.ratinoscanFormScreen);
                  },
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

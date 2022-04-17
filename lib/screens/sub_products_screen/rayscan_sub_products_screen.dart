import 'package:app/components/neu_icon_button.dart';
import 'package:app/routing/routes.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/connectivity_helper.dart';
import 'package:app/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/sub_product_card.dart';

class RayscanSubProductsScreen extends StatelessWidget {
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
            tag: 'ray-scan',
            child: Text(
              'AI Diagnosis',
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
                  heading: 'Chest Abnormalities: X-ray',
                  description:
                      '''Chest Abnormalities with X-Ray can detect and locate the 14 critical thoracic diseases, such as:

1 - Atelectasis
2 - Calcification
3 - Cardiomegaly
4 - Consolidation
5 - ILD
6 - Infiltration
7 - Lung Opacity
8 - Nodule/Mass
9 - Other lesion
10 - Pleural effusion
11 - Pleural thickening
12 - Pneumothorax
13 - Pulmonary fibrosis 
14 - Aortic enlargement

The "No finding" observation was intended to capture the absence of all findings above.''',
                  onTap: () async {
                    bool isConnected =
                        await ConnectivityHelper.checkConnection();
                    if (!isConnected) return;
                    Get.toNamed(Routes.rayscanFormScreen,
                        arguments: RayScanProductType.Yolo);
                  },
                ),
                SizedBox(height: 30),
                SubProductCard(
                  heading: 'Bacterial Infection: X-Ray',
                  description:
                      'Detect TB, Pneumonia, Edema, COVID from X-Ray Images',
                  onTap: () async {
                    bool isConnected =
                        await ConnectivityHelper.checkConnection();
                    if (!isConnected) return;
                    Get.toNamed(Routes.rayscanFormScreen,
                        arguments: RayScanProductType.GradCam);
                  },
                ),
                SizedBox(height: 30),
                SubProductCard(
                  heading: 'CT-Scan',
                  description: 'Detect COVID from CT-Scan Images',
                  onTap: () async {
                    bool isConnected =
                        await ConnectivityHelper.checkConnection();
                    if (!isConnected) return;
                    Get.toNamed(Routes.rayscanFormScreen,
                        arguments: RayScanProductType.CTScan);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

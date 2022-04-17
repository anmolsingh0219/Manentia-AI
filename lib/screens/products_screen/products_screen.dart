import 'dart:io';

import 'package:app/controllers/scan_controller/scan_controller.dart';
import 'package:app/routing/routes.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/assets.dart';
import 'package:app/utilities/image_helper.dart';
import 'package:app/utilities/toast.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: AppColors.blackBackgroundGradient,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 70),
              ProductCard(
                imgPath:
                    'https://app.manentiaadvisory.com/product_ai_diagnosis.png',
                heading: 'AI Diagnosis',
                description:
                    'It\'s Aims At Detecting Respiratory And Lung Diseases With Significant Symptoms Using X-Ray & CT-Scan Images And Provides Quick Diagnosis Reports, And also Marks The Infected Areas Within The Images For easy examination.',
                onTap: () {
                  Get.toNamed(Routes.rayscanSubProductsScreen);
                },
                heroTag: 'ray-scan',
              ),
              const SizedBox(height: 20),
              ProductCard(
                imgPath: 'https://app.manentiaadvisory.com/product_icare.png',
                heading: 'iCare',
                description:
                    'RatinoScan Is Platform Which Can Detects The Symptoms Of Diabetes Retinopathy Using Fundus image And Shows Area Effected By Microaneurysms, Hemorrhages & Exudates.',
                onTap: () {
                  Get.toNamed(Routes.ratinoscanSubProductsScreen);
                },
                heroTag: 'ratino-scan',
              ),
              const SizedBox(height: 20),
              ProductCard(
                imgPath:
                    'https://app.manentiaadvisory.com/poster_brain_tumor.jpeg',
                heading: 'Brain Tumor Detection',
                description:
                    '''With Powerful Deep Learning Algorithm and Image Processing, Manentia Advisory detecting stage of Brain Tumor, Marking Location of Brain Tumor and calculating size of brain tumor.
In Brain Tumor Detection, we are finding stage of Brain Tumor Cancer listed below:
1. Meningioma
2. Glioma
3. Pituitary Tumor''',
                onTap: () {
                  Toast.showToast(
                      false, 'Brain Tumor Detection - coming soon.');
                },
                heroTag: 'brain-tumor',
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String imagePath = await EdgeDetection.detectEdge;
          if (imagePath == null) return;
          final scanController = Get.put(ScanController());
          File imageFile = File(imagePath);
          if (!ImageHelper.validateImage(imageFile)) return;
          scanController.capturedImageFile = imageFile;
          Get.toNamed(Routes.scanScreen);
        },
        child: SvgPicture.asset(Assets.scanIconSvg,
            color: AppColors.whiteColor, height: 30, width: 30),
        backgroundColor: AppColors.orangeColor,
      ),
    );
  }
}

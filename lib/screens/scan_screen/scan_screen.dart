import 'package:app/components/neu_bordered_button.dart';
import 'package:app/components/neu_button.dart';
import 'package:app/components/neu_icon_button.dart';
import 'package:app/controllers/scan_controller/scan_controller.dart';
import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScanScreen extends StatelessWidget {
  final controller = Get.find<ScanController>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.delete<ScanController>();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: Get.theme.iconTheme,
            centerTitle: true,
            title: Text(
              'Patient Details',
              style: Get.textTheme.headline6,
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
            child: GetBuilder<ScanController>(builder: (_) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: Get.height * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: controller.capturedImageFile == null
                                ? Container()
                                // ? CameraWidget(
                                //     scanController: controller,
                                //   )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.file(
                                        controller.capturedImageFile),
                                  ),
                          ),
                        ),
                        // Positioned(
                        //   left: 0,
                        //   right: 0,
                        //   bottom: -10,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       CameraButtonsWidget(scanController: controller),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text('Select an Option',
                            style: Get.textTheme.bodyText1),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildProductTypeButton(
                            'AI Diagnosis',
                            ProductType.RayScan,
                            controller.selectedProductType ==
                                ProductType.RayScan),
                        const SizedBox(width: 20),
                        buildProductTypeButton(
                            'iCare',
                            ProductType.RatinoScan,
                            controller.selectedProductType ==
                                ProductType.RatinoScan),
                      ],
                    ),
                    const SizedBox(height: 20),
                    if (controller.selectedProductType != null)
                      Row(
                        children: [
                          Text('Select Product Type',
                              style: Get.textTheme.bodyText1),
                        ],
                      ),
                    const SizedBox(height: 20),
                    if (controller.selectedProductType == ProductType.RayScan)
                      Column(
                        children: [
                          buildRayScanProductTypeButton(
                              'Chest Abnormalities',
                              RayScanProductType.Yolo,
                              controller.selectedRayScanProductType ==
                                  RayScanProductType.Yolo),
                          const SizedBox(height: 10),
                          buildRayScanProductTypeButton(
                              'Bacterial Infection',
                              RayScanProductType.GradCam,
                              controller.selectedRayScanProductType ==
                                  RayScanProductType.GradCam),
                          const SizedBox(height: 10),
                          buildRayScanProductTypeButton(
                              'CTScan',
                              RayScanProductType.CTScan,
                              controller.selectedRayScanProductType ==
                                  RayScanProductType.CTScan),
                        ],
                      ),
                    if (controller.selectedProductType ==
                        ProductType.RatinoScan)
                      Column(
                        children: [
                          buildRatinoScanProductTypeButton(
                              'Diabetic RatinoPathy (DR)',
                              RatinoScanProductType.DiabaticRatinoPathy,
                              controller.selectedRatinoScanProductType ==
                                  RatinoScanProductType.DiabaticRatinoPathy),
                          const SizedBox(height: 10),
                          buildRatinoScanProductTypeButton(
                              'Glucoma Detection',
                              RatinoScanProductType.GlucomaDetection,
                              controller.selectedRatinoScanProductType ==
                                  RatinoScanProductType.GlucomaDetection),
                        ],
                      ),
                    const SizedBox(height: 20),
                    NeuButton(
                        buttonText: 'Next',
                        radius: 30,
                        onTap: controller.goToFormScreen,
                        gradient: AppColors.orangeGradient),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget buildProductTypeButton(
      String title, ProductType type, bool isSelected) {
    return Expanded(
      child: isSelected
          ? NeuBorderedButton(
              buttonText: title,
              radius: 30,
              onTap: () {
                controller.selectedProductType = type;
                controller.update();
              },
            )
          : TextButton(
              onPressed: () {
                controller.selectedProductType = type;
                controller.update();
              },
              child: Text(title, style: TextStyles.grey14)),
    );
  }

  Widget buildRayScanProductTypeButton(
      String title, RayScanProductType type, bool isSelected) {
    return isSelected
        ? NeuBorderedButton(
            buttonText: title,
            radius: 30,
            onTap: () {
              controller.selectedRayScanProductType = type;
              controller.update();
            },
          )
        : TextButton(
            onPressed: () {
              controller.selectedRayScanProductType = type;
              controller.update();
            },
            child: Text(title, style: TextStyles.grey14));
  }

  Widget buildRatinoScanProductTypeButton(
      String title, RatinoScanProductType type, bool isSelected) {
    return isSelected
        ? NeuBorderedButton(
            buttonText: title,
            radius: 30,
            onTap: () {
              controller.selectedRatinoScanProductType = type;
              controller.update();
            },
          )
        : TextButton(
            onPressed: () {
              controller.selectedRatinoScanProductType = type;
              controller.update();
            },
            child: Text(title, style: TextStyles.grey14));
  }
}

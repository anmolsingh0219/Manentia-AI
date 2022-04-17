import 'package:app/components/neu_button.dart';
import 'package:app/components/neu_dropdown.dart';
import 'package:app/components/neu_icon_button.dart';
import 'package:app/components/neu_textfield.dart';
import 'package:app/controllers/ratinoscan_controller/ratinoscan_controller.dart';
import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/assets.dart';
import 'package:app/utilities/const_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RatinoscanFormScreen extends StatelessWidget {
  final controller = Get.isRegistered<RatinoscanController>()
      ? Get.find<RatinoscanController>()
      : Get.put(RatinoscanController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RatinoscanController>(builder: (_) {
      return SafeArea(
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
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppColors.blackBackgroundGradient,
            ),
            child: Builder(builder: (_) {
              if (controller.loading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset(Assets.reportLoading, height: 150),
                      Text('Please wait while we process your data',
                          style: Get.textTheme.bodyText1),
                    ],
                  ),
                );
              }
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 70),
                      NeuTextField(
                        controller: controller.nameController,
                        hint: 'Name',
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: NeuTextField(
                              controller: controller.ageController,
                              hint: 'Age',
                              isNumber: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: NeuDropdown(
                              items: ConstData.genders,
                              onChanged: (value) {
                                controller.gender = value;
                                controller.update();
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              hint: 'Gender',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: NeuDropdown(
                              items: ConstData.bloodgroups,
                              onChanged: (value) {
                                controller.bloodGroup = value;
                                controller.update();
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              hint: 'Bloodgroup',
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: NeuTextField(
                              controller: controller.weightController,
                              hint: 'Weight',
                              isNumber: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Required';
                                }
                                if (value == '0') {
                                  return 'Invalid value';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      if (controller.pickedImageFile != null)
                        Row(children: [
                          Text('Selected Image', style: TextStyles.grey14)
                        ]),
                      if (controller.pickedImageFile != null)
                        SizedBox(height: 20),
                      if (controller.pickedImageFile != null)
                        Image.file(controller.pickedImageFile),
                      if (controller.pickedImageFile != null)
                        SizedBox(height: 20),
                      Row(
                        children: [
                          Text('Choose Input', style: TextStyles.grey14),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: NeuButton(
                              buttonText: 'Select Image',
                              radius: 8,
                              onTap: () {
                                if (controller.loading) return;
                                Get.focusScope.unfocus();
                                controller.getImage();
                              },
                              gradient: AppColors.neuBackgroundGradient,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: NeuButton(
                              buttonText: 'Diagnose',
                              radius: 8,
                              onTap: () async {
                                if (controller.loading) return;
                                // if (SharedPrefs().isGuestUser) {
                                //   controller.handleGuestUser();
                                //   return;
                                // }
                                controller.ratinoScan();
                              },
                              gradient: AppColors.orangeGradient,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}

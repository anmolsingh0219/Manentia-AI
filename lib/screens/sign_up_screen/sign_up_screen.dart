import 'package:app/components/circular_loading.dart';
import 'package:app/controllers/register_controller/register_controller.dart';
import 'package:app/screens/login_screen/widgets/rounded_clipper.dart';
import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: RoundedClipper(Get.height * 0.4),
                child: Container(
                  height: Get.height * 0.4,
                  width: Get.width,
                  color: AppColors.whiteColor,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Image.asset(
                        Assets.logo,
                        height: 150,
                      ),
                    ),
                  ),
                ),
              ),
              GetBuilder<RegisterController>(
                  init: RegisterController(),
                  builder: (controller) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controller.nameController,
                              style: TextStyles.black14,
                              decoration: InputDecoration(
                                hintText: 'Doctor Name',
                                hintStyle: TextStyles.grey14,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: controller.emailController,
                              style: TextStyles.black14,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyles.grey14,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'This field is required';
                                }
                                if (!value.isEmail) {
                                  return 'Invalid Email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: controller.hospitalNameController,
                              style: TextStyles.black14,
                              decoration: InputDecoration(
                                hintText: 'Hospital Name',
                                hintStyle: TextStyles.grey14,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: controller.hospitalAddressController,
                              style: TextStyles.black14,
                              decoration: InputDecoration(
                                hintText: 'Hospital Address',
                                alignLabelWithHint: true,
                                hintStyle: TextStyles.grey14,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              minLines: 2,
                              maxLines: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: controller.loading
                                      ? AppColors.greyColor
                                      : AppColors.orangeColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                ),
                                onPressed: () {
                                  if (controller.loading) return;
                                  controller.register();
                                },
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: Text(
                                          'Register',
                                          style: Get.textTheme.bodyText1
                                              .copyWith(
                                                  color: AppColors.whiteColor),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: controller.loading
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3, right: 4),
                                              child: CircularLoading(),
                                            )
                                          : SvgPicture.asset(
                                              Assets.longArrow,
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

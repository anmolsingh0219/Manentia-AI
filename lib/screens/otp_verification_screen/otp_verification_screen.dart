import 'package:app/components/neu_button.dart';
import 'package:app/controllers/auth_controller/auth_controller.dart';
import 'package:app/screens/login_screen/widgets/rounded_clipper.dart';
import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final controller = Get.find<AuthController>();

  final ScrollController _scrollController = ScrollController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _scrollController.animateTo(200,
            duration: Duration(milliseconds: 300), curve: Curves.ease);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            gradient: AppColors.blackBackgroundGradient,
          ),
          child: GetBuilder<AuthController>(builder: (_) {
            return SingleChildScrollView(
              controller: _scrollController,
              child: Form(
                key: controller.otpFormKey,
                child: Column(
                  children: [
                    Neumorphic(
                      style: NeumorphicStyle(
                        color: AppColors.neuBackgroundColor,
                        shadowDarkColor: AppColors.neuDarkColor,
                        shadowLightColor: AppColors.neuLightColor,
                        boxShape: NeumorphicBoxShape.path(
                            RoundedClipper(Get.height * 0.5)),
                      ),
                      child: Container(
                        height: Get.height * 0.5,
                        width: Get.width,
                        color: AppColors.neuBackgroundColor,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Text(
                            'We have sent OTP (One Time Password) to your mobile number. Please enter it below to verify.',
                            style: Get.textTheme.bodyText2,
                          ),
                          SizedBox(height: 20),
                          PinPut(
                            controller: controller.otpController,
                            focusNode: _focusNode,
                            fieldsCount: 6,
                            validator: (value) {
                              if (value.length < 6) {
                                return 'OTP must have 6 characters';
                              }
                              return null;
                            },
                            separator: SizedBox(width: 10),
                            textStyle: TextStyles.black14,
                            submittedFieldDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColors.whiteColor,
                            ),
                            selectedFieldDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColors.whiteColor,
                            ),
                            followingFieldDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColors.whiteColor,
                            ),
                            inputDecoration: InputDecoration(
                                counter: null,
                                counterText: '',
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                fillColor: Colors.transparent,
                                filled: false),
                          ),
                          SizedBox(height: 10),
                          controller.secondsLeft > 0
                              ? Text(
                                  'Resend OTP in ${controller.secondsLeft}s',
                                  style: Get.textTheme.bodyText2,
                                )
                              : TextButton(
                                  onPressed: () {
                                    if (controller.loading) return;
                                    controller.getOTP();
                                  },
                                  child: Text('Resend Code',
                                      style: Get.textTheme.bodyText2.copyWith(
                                          decoration:
                                              TextDecoration.underline))),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              child: NeuButton(
                                buttonText: 'Verify',
                                radius: 30,
                                onTap: () {
                                  if (controller.loading) return;
                                  controller.verifyOTP();
                                },
                                gradient: AppColors.orangeGradient,
                                isLoading: controller.loading,
                              )),
                          SizedBox(height: 300),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

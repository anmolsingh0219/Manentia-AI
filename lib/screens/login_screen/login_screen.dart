import 'package:app/components/neu_button.dart';
import 'package:app/components/neu_textfield.dart';
import 'package:app/controllers/auth_controller/auth_controller.dart';
import 'package:app/controllers/auth_controller/google_sign_in_controller.dart';
import 'package:app/screens/login_screen/widgets/rounded_clipper.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.find<AuthController>();
  final googleSignInController = Get.find<GoogleSignInController>();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            gradient: AppColors.blackBackgroundGradient,
          ),
          child: SingleChildScrollView(
            child: GetBuilder<AuthController>(builder: (_) {
              return Column(
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: GetBuilder<GoogleSignInController>(
                              builder: (_) {
                                return NeuButton(
                                    buttonText: 'Sign in with Google - Guest',
                                    radius: 30,
                                    onTap: () {
                                      if (controller.loading ||
                                          googleSignInController.loading)
                                        return;
                                      Get.focusScope.unfocus();
                                      googleSignInController.handleSignIn();
                                    },
                                    gradient: AppColors.orangeGradient,
                                    isLoading: googleSignInController.loading);
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(child: Divider()),
                              SizedBox(width: 10),
                              Text('OR', style: Get.textTheme.bodyText2),
                              SizedBox(width: 10),
                              Expanded(child: Divider()),
                            ],
                          ),
                          SizedBox(height: 20),
                          NeuTextField(
                            controller: controller.doctorIdController,
                            hint: 'Doctor\'s Id',
                            validator: (value) {
                              if (value.length < 10 || value.length > 12) {
                                return 'Invalid Doctor ID';
                              }
                              return null;
                            },
                            isNumber: true,
                          ),
                          SizedBox(height: 15),
                          NeuTextField(
                            controller: controller.phoneController,
                            hint: 'Phone Number',
                            validator: (value) {
                              if (value.length != 10) {
                                return 'Invalid phone number';
                              }
                              return null;
                            },
                            isNumber: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            child: NeuButton(
                              buttonText: 'Login',
                              radius: 30,
                              onTap: () {
                                //If DoctorID and Phone Number are not valid then return from the function
                                if (!formKey.currentState.validate()) return;
                                Get.focusScope.unfocus();
                                if (controller.loading) return;
                                controller.forceResendingToken = null;
                                controller.authenticateDoctor();
                              },
                              gradient: AppColors.orangeGradient,
                              isLoading: controller.loading,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

import 'package:app/components/neu_icon_button.dart';
import 'package:app/controllers/ratinoscan_controller/ratinoscan_controller.dart';
import 'package:app/models/response_models/ratinoscan_response_model.dart';
import 'package:app/routing/routes.dart';
import 'package:app/screens/medical_report_screen/widgets/multiple_image_viewer.dart';
import 'package:app/screens/medical_report_screen/widgets/patient_details_widget.dart';
import 'package:app/utilities/dialog_helper.dart';
import 'package:app/utilities/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/theme/colors.dart';

import 'widgets/doctor_details_widget.dart';

class RatinoscanMedicalReportScreen extends StatelessWidget {
  final RatinoscanResponseModel model;

  RatinoscanMedicalReportScreen({Key key, @required this.model})
      : super(key: key);

  final ratinoscanController = Get.find<RatinoscanController>();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = SharedPrefs().isDarkMode;
    return WillPopScope(
      onWillPop: () async {
        bool isGoingBack = await DialogHelper.showPopConfirmationDialog();
        if (isGoingBack) {
          ratinoscanController.clearData();
        }
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: NeuIconButton(
                child: Icon(Icons.home_rounded,
                    color: Get.theme.iconTheme.color, size: 20),
                radius: 50,
                onTap: () {
                  Get.offAllNamed(Routes.baseScreen);
                },
              )),
          extendBodyBehindAppBar: true,
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
                  SizedBox(height: 40),
                  Text(
                    'Medical Report',
                    style: Get.textTheme.headline2,
                  ),
                  SizedBox(height: 30),
                  MultipleImageViewer(
                      originalImage: model.originalImage,
                      outputImages: model.processedImagePaths),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 20),
                  DoctorDetailsWidget(
                    doctorName: model.doctorName,
                    hospitalName: model.hospitalName,
                    time: model.time,
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  SizedBox(height: 10),
                  PatientDetailsWidget(
                    name: ratinoscanController.nameController.text,
                    age: ratinoscanController.ageController.text,
                    weight: ratinoscanController.weightController.text,
                    bloodGroup: ratinoscanController.bloodGroup,
                    gender: ratinoscanController.gender,
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                  Text(
                      'This report is software generated meant only for the information. Final analysis solely depends on Doctor.',
                      style: Get.textTheme.bodyText2.copyWith(
                          color: (isDarkMode
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor)
                              .withOpacity(0.5)),
                      textAlign: TextAlign.center),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

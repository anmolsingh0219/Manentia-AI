import 'package:app/components/neu_button.dart';
import 'package:app/components/neu_icon_button.dart';
import 'package:app/controllers/rayscan_controller/rayscan_controller.dart';
import 'package:app/models/response_models/rayscan_response_model.dart';
import 'package:app/routing/routes.dart';
import 'package:app/screens/medical_report_screen/widgets/patient_details_widget.dart';
import 'package:app/screens/medical_report_screen/widgets/report_details_widget.dart';
import 'package:app/screens/medical_report_screen/widgets/single_image_viewer.dart';
import 'package:app/utilities/dialog_helper.dart';
import 'package:app/utilities/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/doctor_details_widget.dart';
import 'widgets/multiple_image_viewer.dart';

class MedicalReportScreen extends StatelessWidget {
  final RayScanResponseModel model;

  MedicalReportScreen({Key key, @required this.model}) : super(key: key);

  final rayScanController = Get.find<RayScanController>();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = SharedPrefs().isDarkMode;
    return WillPopScope(
      onWillPop: () async {
        bool isGoingBack = await DialogHelper.showPopConfirmationDialog();
        if (isGoingBack) {
          rayScanController.clearData();
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
                  SizedBox(height: 20),
                  if (model.processedImagePaths != null)
                    MultipleImageViewer(
                        isOriginalImageFile: true,
                        originalImage: rayScanController.pickedImageFile.path,
                        outputImages: model.processedImagePaths),
                  if (model.processedImagePaths == null)
                    SingleImageViewer(
                        rayScanController: rayScanController, model: model),
                  SizedBox(height: 10),
                  if (model.patientId != null)
                    Row(
                      children: [
                        Expanded(
                          child: NeuButton(
                              buttonText: 'Download Report',
                              radius: 30,
                              onTap: () async {
                                String downloadUrl =
                                    'https://manentiaadvisory.com:8000/demo/printReport/?id=${model.patientId}';
                                if (await canLaunch(downloadUrl)) {
                                  await launch(downloadUrl);
                                }
                              },
                              gradient: AppColors.orangeGradient),
                        ),
                      ],
                    ),
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
                    name: rayScanController.nameController.text,
                    age: rayScanController.ageController.text,
                    weight: rayScanController.weightController.text,
                    bloodGroup: rayScanController.bloodGroup,
                    gender: rayScanController.gender,
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                  ReportDetailsWidget(
                    diseases: model.detectionsLabel.split(', '),
                    percentages: model.detectionsConfList,
                    remarks: rayScanController.remarks,
                  ),
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

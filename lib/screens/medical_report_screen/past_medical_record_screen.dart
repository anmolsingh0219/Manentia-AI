import 'package:app/api/api.dart';
import 'package:app/components/neu_button.dart';
import 'package:app/components/neu_icon_button.dart';
import 'package:app/models/response_models/history_response_model.dart';
import 'package:app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:app/screens/medical_report_screen/widgets/multiple_image_viewer.dart';
import 'package:app/screens/medical_report_screen/widgets/patient_details_widget.dart';
import 'package:app/screens/medical_report_screen/widgets/report_details_widget.dart';
import 'package:app/utilities/open_photo.dart';
import 'package:app/utilities/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/doctor_details_widget.dart';

class PastMedicalReportScreen extends StatelessWidget {
  final HistoryRecord record;
  final ImageType imageType;

  PastMedicalReportScreen({Key key, @required this.record, this.imageType})
      : super(key: key);

  String fixImagePath(String imagePath) {
    if (!imagePath.contains('/media')) {
      return '/media' +
          (imagePath.substring(0, 1) == '/' ? '' : '/') +
          imagePath;
    }
    return imagePath;
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = SharedPrefs().isDarkMode;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: Get.theme.iconTheme,
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
                SizedBox(height: 40),
                Text(
                  'Medical Report',
                  style: Get.textTheme.headline2,
                ),
                SizedBox(height: 20),
                if (imageType != ImageType.CTSCAN)
                  MultipleImageViewer(
                      originalImage: imageType == ImageType.XRAY
                          ? record.image
                          : record.originalImage,
                      outputImages: record.processedImagePaths),
                if (imageType == ImageType.CTSCAN)
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            OpenPhoto.openDialog(
                                context,
                                NetworkImage(API.dio.options.baseUrl +
                                    fixImagePath(record.image)),
                                'past-input-image');
                          },
                          child: Hero(
                              tag: 'past-input-image',
                              child: Image.network(
                                  API.dio.options.baseUrl +
                                      fixImagePath(record.image),
                                  errorBuilder: (context, error, stackTrace) {
                                return Placeholder(
                                  fallbackHeight: 150,
                                );
                              }, height: 150)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            OpenPhoto.openDialog(
                                context,
                                NetworkImage(API.dio.options.baseUrl +
                                    fixImagePath(record.resultImage)),
                                'past-output-image');
                          },
                          child: Hero(
                            tag: 'past-output-image',
                            child: Image.network(
                              API.dio.options.baseUrl +
                                  fixImagePath(record.resultImage),
                              errorBuilder: (context, error, stackTrace) {
                                return Placeholder(
                                  fallbackHeight: 150,
                                );
                              },
                              height: 150,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: NeuButton(
                          buttonText: 'Download Report',
                          radius: 30,
                          onTap: () async {
                            String downloadUrl =
                                'https://manentiaadvisory.com:8000/demo/printReport/?id=${record.objId}';
                            if (await canLaunch(downloadUrl)) {
                              await launch(downloadUrl);
                            }
                          },
                          gradient: AppColors.orangeGradient),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(color: AppColors.whiteColor.withOpacity(0.2)),
                SizedBox(height: 20),
                DoctorDetailsWidget(
                  doctorName: record.doctorName,
                  hospitalName: record.hospitalName,
                  time: record.date,
                ),
                SizedBox(height: 20),
                Divider(color: AppColors.whiteColor.withOpacity(0.2)),
                SizedBox(height: 10),
                PatientDetailsWidget(
                  age: record.patientAge.toString(),
                  bloodGroup: record.patientBloodGroup,
                  gender: record.patientGender,
                  name: record.patientName,
                  weight: record.patientWeight.toString(),
                ),
                SizedBox(height: 10),
                if (imageType != ImageType.RATINOSCAN)
                  Divider(color: AppColors.whiteColor.withOpacity(0.2)),
                if (imageType != ImageType.RATINOSCAN) SizedBox(height: 10),
                if (imageType != ImageType.RATINOSCAN)
                  ReportDetailsWidget(
                    diseases: (imageType == ImageType.CTSCAN
                            ? record.covidPrediction
                            : record.abnormalities)
                        .split(', '),
                    percentages: record.confidence
                        .split(', ')
                        .map((value) => imageType == ImageType.CTSCAN
                            ? double.parse(value).toInt()
                            : (double.parse(value) * 100).toInt())
                        .toList(),
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
    );
  }
}

import 'dart:io';

import 'package:app/api/api.dart';
import 'package:app/components/image_source_widget.dart';
import 'package:app/models/response_models/rayscan_response_model.dart';
import 'package:app/routing/routes.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/image_helper.dart';
import 'package:app/utilities/shared_prefs.dart';
import 'package:app/utilities/toast.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class RayScanController extends GetxController {
  bool loading = false; //Handle loading state
  RayScanResponseModel model; //Response from the API

  //Image picker instance
  final picker = ImagePicker();

  //FormKey to validate form
  final formKey = GlobalKey<FormState>();

  //Patient Details
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  String gender;
  String bloodGroup;
  final weightController = TextEditingController();
  File pickedImageFile;

  //Remarks to show on Medical Reports screen
  String remarks = '';

  //-------------------------------------------------------------------------YOLO

  getYoloXRay() async {
    //Return from the function if fields are not valid
    if (!formKey.currentState.validate()) return;
    if (pickedImageFile == null) {
      Toast.showToast(false, 'Please select an image');
      return;
    }

    loading = true;
    update();

    var formData = dio.FormData.fromMap({
      'name': nameController.text,
      'age': int.parse(ageController.text),
      'bloodGroup': bloodGroup,
      'weight': int.parse(weightController.text),
      'token': SharedPrefs().authToken,
      'gender': gender,
      'doctorID': SharedPrefs().doctorID,
      'xray': await dio.MultipartFile.fromFile(pickedImageFile.path,
          filename: basename(pickedImageFile.path).removeAllWhitespace),
    });
    var response = await API.rayscanAPI.yoloXRay(formData);
    if (response != null) {
      model = response;
      remarks =
          'Detections and Annotation of Disease along with confidence details are marked on the processed image.';
      Get.toNamed(Routes.medicalReportScreen, arguments: model);
      loading = false;
      update();
    } else {
      loading = false;
      update();
    }
  }

  //-------------------------------------------------------------------------GRADCAM

  getGradCam() async {
    //Return from the function if fields are not valid
    if (!formKey.currentState.validate()) return;
    if (pickedImageFile == null) {
      Toast.showToast(false, 'Please select an image');
      return;
    }

    loading = true;
    update();

    var formData = dio.FormData.fromMap({
      'name': nameController.text,
      'age': int.parse(ageController.text),
      'bloodGroup': bloodGroup,
      'weight': int.parse(weightController.text),
      'token': SharedPrefs().authToken,
      'gender': gender,
      'doctorID': SharedPrefs().doctorID,
      'gradcam': await dio.MultipartFile.fromFile(pickedImageFile.path,
          filename: basename(pickedImageFile.path).removeAllWhitespace),
    });
    var response = await API.rayscanAPI.getGradcam(formData);
    if (response != null) {
      model = response;
      remarks =
          'Green and Yellow area are infected areas. Where AI Diagnosis doesn\’t find any infection are shown by blue shadded area.';
      Get.toNamed(Routes.medicalReportScreen, arguments: model);
      loading = false;
      update();
    } else {
      loading = false;
      update();
    }
  }

  //-------------------------------------------------------------------------CT-SCAN
  getCTScan() async {
    //Return from the function if fields are not valid
    if (!formKey.currentState.validate()) return;
    if (pickedImageFile == null) {
      Toast.showToast(false, 'Please select an image');
      return;
    }

    loading = true;
    update();

    var formData = dio.FormData.fromMap({
      'name': nameController.text,
      'age': int.parse(ageController.text),
      'bloodGroup': bloodGroup,
      'weight': int.parse(weightController.text),
      'token': SharedPrefs().authToken,
      'doctorID': SharedPrefs().doctorID,
      'gender': gender,
      'ctscan': await dio.MultipartFile.fromFile(pickedImageFile.path,
          filename: basename(pickedImageFile.path).removeAllWhitespace),
    });
    var response = await API.rayscanAPI.getCTScan(formData);
    if (response != null) {
      model = response;
      remarks =
          'Green and Yellow area are infected areas. Where AI Diagnosis doesn\’t find any infection are shown by blue shadded area.';
      Get.toNamed(Routes.medicalReportScreen, arguments: model);
      loading = false;
      update();
    } else {
      loading = false;
      update();
    }
  }

  Future getImage() async {
    //Ask user to select image from gallery or camera
    ImageSource source;
    await Get.defaultDialog(
      title: 'Select Image from',
      titleStyle: Get.textTheme.bodyText2,
      backgroundColor: AppColors.neuBackgroundColor,
      content: ImageSourceWidget(
        onChanged: (value) {
          source = value;
        },
      ),
    );

    if (source == null) return;

    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      if (!ImageHelper.validateImage(File(pickedFile.path))) {
        Toast.showToast(
            false, 'Please upload image with size more than 200x250');
        return;
      }
      pickedImageFile = File(pickedFile.path);
      update();
    }
  }

  //-------------------------------------------------------------------------CLEAR-DATA

  clearData() {
    nameController.clear();
    ageController.clear();
    gender = null;
    bloodGroup = null;
    weightController.clear();
    pickedImageFile = null;
    remarks = '';
    update();
  }

  //-------------------------------------------------------------------------GUEST-USER

  String guestUserOriginalImage;

  // void handleGuestUser(RayScanProductType rayScanProductType) async {
  //   //Return from the function if fields are not valid
  //   if (!formKey.currentState.validate()) return;
  //   loading = true;
  //   update();
  //   await Future.delayed(Duration(seconds: 3));
  //   GuestResponseModel guestResponseModel =
  //       guestResponseModelFromJson(SharedPrefs().guestResponseModel);
  //   RayScanResponseModel model;
  //   if (rayScanProductType == RayScanProductType.Yolo) {
  //     guestUserOriginalImage =
  //         API.dio.options.baseUrl + guestResponseModel.yolo.originalImage;
  //     model = RayScanResponseModel(
  //       detectedPath:
  //           API.dio.options.baseUrl + guestResponseModel.yolo.processedImage,
  //       detectionsLabel: guestResponseModel.yolo.diseases.join(', '),
  //       detectionsConfList: guestResponseModel.yolo.prediction
  //           .map((value) => int.parse(value.replaceAll('%', '')))
  //           .toList(),
  //       time: DateTime.now(),
  //       doctorName: SharedPrefs().guestUserName,
  //       hospitalName: 'Manentia',
  //     );
  //     remarks =
  //         'Detections and Annotation of Disease along with confidence details are maked on the processed image.';
  //   }
  //   if (rayScanProductType == RayScanProductType.GradCam) {
  //     guestUserOriginalImage =
  //         API.dio.options.baseUrl + guestResponseModel.gradcam.originalImage;
  //     model = RayScanResponseModel(
  //       detectedPath:
  //           API.dio.options.baseUrl + guestResponseModel.gradcam.processedImage,
  //       detectionsLabel: guestResponseModel.gradcam.diseases,
  //       detectionsConfList: [
  //         int.parse(guestResponseModel.gradcam.confidence.replaceAll('%', ''))
  //       ],
  //       time: DateTime.now(),
  //       doctorName: SharedPrefs().guestUserName,
  //       hospitalName: 'Manentia',
  //     );
  //     remarks =
  //         'Green and Yellow area are infected areas. Where AI Diagnosis doesn\’t find any infection are shown by blue shadded area.';
  //   }
  //   if (rayScanProductType == RayScanProductType.CTScan) {
  //     guestUserOriginalImage =
  //         API.dio.options.baseUrl + guestResponseModel.ctscan.originalImage;
  //     model = RayScanResponseModel(
  //       detectedPath:
  //           API.dio.options.baseUrl + guestResponseModel.ctscan.processedImage,
  //       detectionsLabel: guestResponseModel.ctscan.diseases,
  //       detectionsConfList: [
  //         int.parse(guestResponseModel.ctscan.confidence.replaceAll('%', ''))
  //       ],
  //       time: DateTime.now(),
  //       doctorName: SharedPrefs().guestUserName,
  //       hospitalName: 'Manentia',
  //     );
  //     remarks =
  //         'Green and Yellow area are infected areas. Where AI Diagnosis doesn\’t find any infection are shown by blue shadded area.';
  //   }
  //   Get.toNamed(Routes.medicalReportScreen, arguments: model);
  //   loading = false;
  //   update();
  // }
}

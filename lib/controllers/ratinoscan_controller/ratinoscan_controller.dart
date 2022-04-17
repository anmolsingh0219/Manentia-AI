import 'dart:io';

import 'package:app/api/api.dart';
import 'package:app/components/image_source_widget.dart';
import 'package:app/models/response_models/ratinoscan_response_model.dart';
import 'package:app/routing/routes.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/shared_prefs.dart';
import 'package:app/utilities/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart';

class RatinoscanController extends GetxController {
  bool loading = false; //Handle loading state
  RatinoscanResponseModel model; //Response from the API

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

  //-------------------------------------------------------------------------YOLO

  ratinoScan() async {
    //Return from the function if fields are not valid
    if (!formKey.currentState.validate()) return;
    if (pickedImageFile == null) {
      Toast.showToast(false, 'Please select an image');
      return;
    }

    loading = true;
    update();
    print(SharedPrefs().authToken);
    var formData = dio.FormData.fromMap({
      'name': nameController.text,
      'age': int.parse(ageController.text),
      'bloodGroup': bloodGroup,
      'weight': int.parse(weightController.text),
      'token': SharedPrefs().authToken,
      'gender': gender,
      'doctorID': SharedPrefs().doctorID,
      'drscan': await dio.MultipartFile.fromFile(pickedImageFile.path,
          filename: basename(pickedImageFile.path).removeAllWhitespace),
    });
    var response = await API.ratinoscanAPI.ratinoscan(formData);
    if (response != null) {
      model = response;
      Get.toNamed(Routes.ratinoscanReportScreen, arguments: model);
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
    update();
  }

  //-------------------------------------------------------------------------GUEST USER

  // void handleGuestUser() async {
  //   //Return from the function if fields are not valid
  //   if (!formKey.currentState.validate()) return;
  //   loading = true;
  //   update();
  //   await Future.delayed(Duration(seconds: 3));
  //   GuestResponseModel guestResponseModel =
  //       guestResponseModelFromJson(SharedPrefs().guestResponseModel);
  //   RatinoscanResponseModel model = RatinoscanResponseModel(
  //     time: DateTime.now(),
  //     doctorName: SharedPrefs().guestUserName,
  //     hospitalName: 'Manentia',
  //     originalImage:
  //         guestResponseModel.ratinoscan.processedImagePaths.first.imagePath,
  //     processedImagePaths: guestResponseModel.ratinoscan.processedImagePaths,
  //   );
  //   Get.toNamed(Routes.ratinoscanReportScreen, arguments: model);
  //   loading = false;
  //   update();
  // }
}

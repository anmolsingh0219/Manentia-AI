import 'package:app/api/api.dart';
import 'package:app/routing/routes.dart';
import 'package:app/utilities/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  bool loading = false;

  //-------------------------------------------------------------------------Registration

  //FormKey to validate form fields
  final formKey = GlobalKey<FormState>();

  //Text controller for Name
  final TextEditingController nameController = TextEditingController();
  //Text controller for EmailID
  final TextEditingController emailController = TextEditingController();
  //Text controller for Hospital Name
  final TextEditingController hospitalNameController = TextEditingController();
  //Text controller for Hospital Address
  final TextEditingController hospitalAddressController =
      TextEditingController();

  register() async {
    //If Form Fields are not valid then return from the function
    if (!formKey.currentState.validate()) return;
    Get.focusScope.unfocus();
    loading = true;
    update();
    bool response = await API.registerAPI.register(
        emailController.text.trim(),
        nameController.text.trim(),
        hospitalNameController.text.trim(),
        hospitalAddressController.text.trim());
    if (response) {
      Get.offAllNamed(Routes.baseScreen);
    } else {
      Toast.showToast(false, 'Registration Failed');
    }
    loading = false;
    update();
  }
}

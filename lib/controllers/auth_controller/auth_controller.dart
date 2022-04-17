import 'dart:async';

import 'package:app/api/api.dart';
import 'package:app/models/response_models/doctor_auth_response_model.dart';
import 'package:app/routing/routes.dart';
import 'package:app/utilities/log.dart';
import 'package:app/utilities/shared_prefs.dart';
import 'package:app/utilities/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'google_sign_in_controller.dart';

class AuthController extends GetxController {
  //Handling loading state
  bool loading = false;

  //-------------------------------------------------------------------------Doctor Authentication

  //Text controller for Doctor ID
  final TextEditingController doctorIdController = TextEditingController(
      text:
          SharedPrefs().doctorID == 0 ? '' : SharedPrefs().doctorID.toString());
  //Text controller for Phone Number
  final TextEditingController phoneController = TextEditingController(
      text: SharedPrefs().doctorPhone.isNotEmpty
          ? SharedPrefs().doctorPhone.substring(3)
          : SharedPrefs().doctorPhone);

  //Whether user is already registered or not
  bool isRegistered = false;

  authenticateDoctor() async {
    loading = true;
    update();

    DoctorAuthResponseModel model = await API.authAPI.isDoctorAuthentic(
        doctorIdController.text.trim(), '+91' + phoneController.text.trim());
    bool isSuccess = model.message == 'success';
    Toast.showToast(isSuccess, model.message);
    if (isSuccess) {
      //Storing token in Shared Preferences if authentication is successful
      SharedPrefs().authToken = model.token;
      SharedPrefs().doctorID = int.parse(doctorIdController.text.trim());
      SharedPrefs().doctorPhone = '+91' + phoneController.text.trim();
      isRegistered = model.isRegistered;
      API.dio.options.baseUrl = model.apiEndPoint;
      SharedPrefs().apiEndPoint = model.apiEndPoint;
      getOTP();
    } else {
      loading = false;
      update();
    }
  }

  //-------------------------------------------------------------------------OTP Verification

  //Firebase Instance
  FirebaseAuth auth = FirebaseAuth.instance;

  //FormKey to validate OTP
  final otpFormKey = GlobalKey<FormState>();

  //Text controller for OTP
  final TextEditingController otpController = TextEditingController();

  //Verification Code from Firebase
  String verificationCode;

  //Timer
  Timer timer;
  int secondsLeft = 65;

  //Resend OTP
  int forceResendingToken;

  getOTP() async {
    if (forceResendingToken == null) {
      loading = true;
      update();
    }
    secondsLeft = 65;
    await auth.verifyPhoneNumber(
      phoneNumber: '+91${phoneController.text.trim()}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        var userCrendential = await auth.signInWithCredential(credential);
        if (userCrendential.user != null) {
          Log.print('FirebaseAuth Completed');
          forceResendingToken = null;
          Toast.showToast(true, 'OTP Verification Successful');
          Get.offAllNamed(
              isRegistered ? Routes.baseScreen : Routes.signUpScreen);
        }
        loading = false;
        update();
      },
      verificationFailed: (FirebaseAuthException e) {
        Log.print(e.toString(), 'FirebaseAuthException');

        Toast.showToast(false, 'OTP Verification Failed');
        loading = false;
        update();
      },
      codeSent: (String verificationId, int resendToken) {
        verificationCode = verificationId;
        if (forceResendingToken == null) {
          Get.toNamed(Routes.otpVerificationScreen);
        }
        const oneSec = const Duration(seconds: 1);
        timer = new Timer.periodic(
          oneSec,
          (Timer timer) {
            if (secondsLeft == 0) {
              forceResendingToken = resendToken;
              timer.cancel();
            } else {
              secondsLeft--;
              update();
            }
          },
        );
        loading = false;
        update();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        loading = false;
        update();
      },
      timeout: Duration(seconds: 65),
      forceResendingToken: forceResendingToken,
    );
  }

  //Verify OTP
  verifyOTP() async {
    //Return from the function if OTP is not entered
    if (!otpFormKey.currentState.validate()) return;
    if (verificationCode == null) return;
    Get.focusScope.unfocus();

    loading = true;
    update();

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationCode, smsCode: otpController.text);
      var userCrendential = await auth.signInWithCredential(credential);
      print(userCrendential);
      if (userCrendential.user != null) {
        Log.print('FirebaseAuth Completed');
        forceResendingToken = null;
        Get.offAllNamed(isRegistered ? Routes.baseScreen : Routes.signUpScreen);
        Toast.showToast(true, 'OTP Verification Successful');
      } else {
        Get.back();
        Toast.showToast(false, 'OTP Verification Failed');
        verificationCode = null;
      }
    } catch (error) {
      loading = false;
      update();
      Log.print(error.toString(), 'OTP Verification Error');
      Get.back();
      Toast.showToast(false, 'OTP Verification Failed');
    }

    loading = false;
    update();
  }

  //Check whether user is already signed in
  bool isSignedIn() {
    return auth.currentUser != null;
  }

  //Sign out user
  signOut() async {
    await auth.signOut();
    await Get.find<GoogleSignInController>().logOut();
    otpController.clear();
    SharedPrefs().authToken = "";
    SharedPrefs().isGuestUser = false;
    Get.offAllNamed(Routes.loginScreen);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

import 'dart:io';

import 'package:app/controllers/ratinoscan_controller/ratinoscan_controller.dart';
import 'package:app/controllers/rayscan_controller/rayscan_controller.dart';
import 'package:app/routing/routes.dart';
import 'package:app/utilities/connectivity_helper.dart';
import 'package:app/utilities/enums.dart';
import 'package:app/utilities/toast.dart';
import 'package:get/get.dart';

class ScanController extends GetxController {
  //---------------------------------------------- Old Camera System
  // CameraDescription camera;
  // CameraController cameraController;
  // Future<void> initializeControllerFuture;

  // @override
  // onReady() {
  //   super.onReady();
  //   WidgetsFlutterBinding.ensureInitialized();
  //   initializeCamera();
  // }

  // initializeCamera() async {
  //   // Obtain a list of the available cameras on the device.
  //   final cameras = await availableCameras();
  //   camera = cameras.first;

  //   cameraController = CameraController(
  //     // Get a specific camera from the list of available cameras.
  //     camera,
  //     // Define the resolution to use.
  //     ResolutionPreset.high,
  //   );

  //   // Next, initialize the controller. This returns a Future.
  //   initializeControllerFuture = cameraController.initialize();
  //   update();
  // }

  // takePicture() async {
  //   await initializeControllerFuture;
  //   var xFile = await cameraController.takePicture();
  //   capturedImageFile = File(xFile.path);
  //   update();
  // }

  // cancelCapturedPicture() {
  //   capturedImageFile = null;
  //   update();
  // }

  // @override
  // void dispose() {
  //   cameraController.dispose();
  //   super.dispose();
  // }

  //----------------------------------------------------------------------

  //Captured Image file
  File capturedImageFile;

  //Selected Products
  ProductType selectedProductType;
  RayScanProductType selectedRayScanProductType;
  RatinoScanProductType selectedRatinoScanProductType;

  goToFormScreen() async {
    if (selectedProductType == null) {
      Toast.showToast(false, 'Please select an option');
      return;
    }
    if (selectedProductType == ProductType.RayScan) {
      if (selectedRayScanProductType == null) {
        Toast.showToast(false, 'Please select a RayScan option');
        return;
      }
    }
    if (selectedProductType == ProductType.RatinoScan) {
      if (selectedRatinoScanProductType == null) {
        Toast.showToast(false, 'Please select a RatinoScan option');
        return;
      }
    }
    bool isConnected = await ConnectivityHelper.checkConnection();
    if (!isConnected) return;
    if (selectedProductType == ProductType.RayScan) {
      final rayScanController = Get.isRegistered<RayScanController>()
          ? Get.find<RayScanController>()
          : Get.put(RayScanController());
      rayScanController.pickedImageFile = capturedImageFile;
      Get.toNamed(Routes.rayscanFormScreen,
          arguments: selectedRayScanProductType);
    } else {
      final ratinoScanController = Get.isRegistered<RatinoscanController>()
          ? Get.find<RatinoscanController>()
          : Get.put(RatinoscanController());
      ratinoScanController.pickedImageFile = capturedImageFile;
      Get.toNamed(Routes.ratinoscanFormScreen);
    }
  }
}

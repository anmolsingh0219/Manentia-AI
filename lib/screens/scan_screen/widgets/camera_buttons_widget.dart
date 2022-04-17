// import 'package:app/components/neu_icon_button.dart';
// import 'package:app/controllers/scan_controller/scan_controller.dart';
// import 'package:app/theme/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CameraButtonsWidget extends StatelessWidget {
//   final ScanController scanController;
//   const CameraButtonsWidget({Key key, @required this.scanController})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ScanController>(
//       builder: (_) {
//         if (scanController.capturedImageFile != null) {
//           return NeuIconButton(
//             child: Icon(Icons.close, color: AppColors.orangeColor, size: 20),
//             radius: 50,
//             onTap: scanController.cancelCapturedPicture,
//           );
//         }
//         return NeuIconButton(
//           child: Icon(Icons.camera_alt, color: AppColors.orangeColor, size: 20),
//           radius: 50,
//           onTap: scanController.takePicture,
//         );
//       },
//     );
//   }
// }

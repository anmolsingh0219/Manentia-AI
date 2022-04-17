// import 'package:app/components/circular_loading.dart';
// import 'package:app/controllers/scan_controller/scan_controller.dart';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CameraWidget extends StatelessWidget {
//   final ScanController scanController;
//   const CameraWidget({Key key, @required this.scanController})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ScanController>(builder: (_) {
//       return FutureBuilder<void>(
//         future: scanController.initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the Future is complete, display the preview.
//             return ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: CameraPreview(scanController.cameraController),
//             );
//           } else {
//             // Otherwise, display a loading indicator.
//             return Center(child: const CircularLoading());
//           }
//         },
//       );
//     });
//   }
// }

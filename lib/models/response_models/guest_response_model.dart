// To parse this JSON data, do
//
//     final guestResponseModel = guestResponseModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final guestResponseModel = guestResponseModelFromJson(jsonString);

import 'dart:convert';

GuestResponseModel guestResponseModelFromJson(String str) => GuestResponseModel.fromJson(json.decode(str));

String guestResponseModelToJson(GuestResponseModel data) => json.encode(data.toJson());

class GuestResponseModel {
    GuestResponseModel({
        this.token,
        this.doctorId,
        this.apiEndPoint,
    });

    String token;
    String doctorId;
    String apiEndPoint;

    factory GuestResponseModel.fromJson(Map<String, dynamic> json) => GuestResponseModel(
        token: json["token"],
        doctorId: json["doctorID"],
        apiEndPoint: json["apiEndPoint"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "doctorID": doctorId,
        "apiEndPoint": apiEndPoint,
    };
}



// import 'dart:convert';

// import 'ratinoscan_response_model.dart';

// GuestResponseModel guestResponseModelFromJson(String str) =>
//     GuestResponseModel.fromJson(json.decode(str));

// String guestResponseModelToJson(GuestResponseModel data) =>
//     json.encode(data.toJson());

// class GuestResponseModel {
//   GuestResponseModel({
//     this.message,
//     this.yolo,
//     this.gradcam,
//     this.ctscan,
//     this.ratinoscan,
//   });

//   String message;
//   GuestYolo yolo;
//   GuestCtscan gradcam;
//   GuestCtscan ctscan;
//   GuestRatinoscan ratinoscan;

//   factory GuestResponseModel.fromJson(Map<String, dynamic> json) =>
//       GuestResponseModel(
//         message: json["message"],
//         yolo: GuestYolo.fromJson(json["yolo"]),
//         gradcam: GuestCtscan.fromJson(json["gradcam"]),
//         ctscan: GuestCtscan.fromJson(json["ctscan"]),
//         ratinoscan: GuestRatinoscan.fromJson(json["ratinoscan"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "yolo": yolo.toJson(),
//         "gradcam": gradcam.toJson(),
//         "ctscan": ctscan.toJson(),
//         "ratinoscan": ratinoscan.toJson(),
//       };
// }

// class GuestCtscan {
//   GuestCtscan({
//     this.originalImage,
//     this.processedImage,
//     this.diseases,
//     this.confidence,
//   });

//   String originalImage;
//   String processedImage;
//   String diseases;
//   String confidence;

//   factory GuestCtscan.fromJson(Map<String, dynamic> json) => GuestCtscan(
//         originalImage: json["original_image"],
//         processedImage: json["processed_image"],
//         diseases: json["diseases"],
//         confidence: json["confidence"],
//       );

//   Map<String, dynamic> toJson() => {
//         "original_image": originalImage,
//         "processed_image": processedImage,
//         "diseases": diseases,
//         "confidence": confidence,
//       };
// }

// class GuestRatinoscan {
//   GuestRatinoscan({
//     this.processedImagePaths,
//   });

//   List<ProcessedImagePath> processedImagePaths;

//   factory GuestRatinoscan.fromJson(Map<String, dynamic> json) =>
//       GuestRatinoscan(
//         processedImagePaths: List<ProcessedImagePath>.from(
//             json["processedImage_paths"]
//                 .map((x) => ProcessedImagePath.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "processedImage_paths":
//             List<dynamic>.from(processedImagePaths.map((x) => x.toJson())),
//       };
// }

// class GuestYolo {
//   GuestYolo({
//     this.originalImage,
//     this.processedImage,
//     this.diseases,
//     this.prediction,
//   });

//   String originalImage;
//   String processedImage;
//   List<String> diseases;
//   List<String> prediction;

//   factory GuestYolo.fromJson(Map<String, dynamic> json) => GuestYolo(
//         originalImage: json["original_image"],
//         processedImage: json["processed_image"],
//         diseases: List<String>.from(json["diseases"].map((x) => x)),
//         prediction: List<String>.from(json["prediction"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "original_image": originalImage,
//         "processed_image": processedImage,
//         "diseases": List<dynamic>.from(diseases.map((x) => x)),
//         "prediction": List<dynamic>.from(prediction.map((x) => x)),
//       };
// }

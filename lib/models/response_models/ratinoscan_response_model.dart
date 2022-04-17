// To parse this JSON data, do
//
//     final ratinoscanResponseModel = ratinoscanResponseModelFromJson(jsonString);

import 'dart:convert';

RatinoscanResponseModel ratinoscanResponseModelFromJson(String str) =>
    RatinoscanResponseModel.fromJson(json.decode(str));

String ratinoscanResponseModelToJson(RatinoscanResponseModel data) =>
    json.encode(data.toJson());

class RatinoscanResponseModel {
  RatinoscanResponseModel({
    this.time,
    this.doctorName,
    this.hospitalName,
    this.imageValid,
    this.originalImage,
    this.processedImagePaths,
  });

  DateTime time;
  String doctorName;
  String hospitalName;
  String imageValid;
  String originalImage;
  List<ProcessedImagePath> processedImagePaths;

  factory RatinoscanResponseModel.fromJson(Map<String, dynamic> json) =>
      RatinoscanResponseModel(
        time: DateTime.parse(json["time"]),
        doctorName: json["doctorName"],
        hospitalName: json["hospitalName"],
        imageValid: json["imageValid"],
        originalImage: json["originalImage"],
        processedImagePaths: List<ProcessedImagePath>.from(
            json["processedImage_paths"]
                .map((x) => ProcessedImagePath.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
        "doctorName": doctorName,
        "hospitalName": hospitalName,
        "imageValid": imageValid,
        "originalImage": originalImage,
        "processedImage_paths":
            List<dynamic>.from(processedImagePaths.map((x) => x.toJson())),
      };
}

class ProcessedImagePath {
  ProcessedImagePath({
    this.name,
    this.imagePath,
  });

  String name;
  String imagePath;

  factory ProcessedImagePath.fromJson(Map<String, dynamic> json) =>
      ProcessedImagePath(
        name: json["name"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image_path": imagePath,
      };
}

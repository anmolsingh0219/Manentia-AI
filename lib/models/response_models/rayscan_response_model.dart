// To parse this JSON data, do
//
//     final rayScanResponseModel = rayScanResponseModelFromJson(jsonString);

import 'dart:convert';

import 'ratinoscan_response_model.dart';

RayScanResponseModel rayScanResponseModelFromJson(String str) => RayScanResponseModel.fromJson(json.decode(str));

String rayScanResponseModelToJson(RayScanResponseModel data) => json.encode(data.toJson());

class RayScanResponseModel {
    RayScanResponseModel({
        this.processedImagePaths,
        this.imageValid,
        this.time,
        this.path,
        this.patientId,
        this.detectedPath,
        this.doctorName,
        this.hospitalName,
        this.tokenValid,
        this.detectionsLabel,
        this.detectionsConfList,
    });

    List<ProcessedImagePath> processedImagePaths;
    String imageValid;
    DateTime time;
    String path;
    int patientId;
    String detectedPath;
    String doctorName;
    String hospitalName;
    String tokenValid;
    String detectionsLabel;
    List<int> detectionsConfList;

    factory RayScanResponseModel.fromJson(Map<String, dynamic> json) => RayScanResponseModel(
        processedImagePaths: json["processedImage_paths"] == null ? null : List<ProcessedImagePath>.from(json["processedImage_paths"].map((x) => ProcessedImagePath.fromJson(x))),
        imageValid: json["imageValid"] == null ? null : json["imageValid"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        path: json["path"] == null ? null : json["path"],
        patientId: json["patiend_id"] == null ? null : json["patiend_id"],
        detectedPath: json["detected_path"] == null ? null : json["detected_path"],
        doctorName: json["doctorName"] == null ? null : json["doctorName"],
        hospitalName: json["hospitalName"] == null ? null : json["hospitalName"],
        tokenValid: json["tokenValid"] == null ? null : json["tokenValid"],
        detectionsLabel: json["detections_label"] == null ? null : json["detections_label"],
        detectionsConfList: json["detections_conf_List"] == null ? null : List<int>.from(json["detections_conf_List"].map((x) => x.toInt())),
    );

    Map<String, dynamic> toJson() => {
        "processedImage_paths": processedImagePaths == null ? null : List<dynamic>.from(processedImagePaths.map((x) => x.toJson())),
        "imageValid": imageValid == null ? null : imageValid,
        "time": time == null ? null : time.toIso8601String(),
        "path": path == null ? null : path,
        "patiend_id": patientId == null ? null : patientId,
        "detected_path": detectedPath == null ? null : detectedPath,
        "doctorName": doctorName == null ? null : doctorName,
        "hospitalName": hospitalName == null ? null : hospitalName,
        "tokenValid": tokenValid == null ? null : tokenValid,
        "detections_label": detectionsLabel == null ? null : detectionsLabel,
        "detections_conf_List": detectionsConfList == null ? null : List<dynamic>.from(detectionsConfList.map((x) => x)),
    };
}
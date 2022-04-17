// To parse this JSON data, do
//
//     final historyResponseModel = historyResponseModelFromJson(jsonString);

import 'dart:convert';

import 'ratinoscan_response_model.dart';

HistoryResponseModel historyResponseModelFromJson(String str) =>
    HistoryResponseModel.fromJson(json.decode(str));

String historyResponseModelToJson(HistoryResponseModel data) =>
    json.encode(data.toJson());

class HistoryResponseModel {
  HistoryResponseModel({
    this.name,
    this.xrImg,
    this.ctImg,
    this.ratinoscanImages,
    this.totalCount,
    this.xrayImageCount,
    this.ctscanImageCount,
    this.ratinoscanImageCount,
  });

  String name;
  List<HistoryRecord> xrImg;
  List<HistoryRecord> ctImg;
  List<HistoryRecord> ratinoscanImages;
  int totalCount;
  int xrayImageCount;
  int ctscanImageCount;
  String ratinoscanImageCount;

  factory HistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      HistoryResponseModel(
        name: json["name"],
        xrImg: List<HistoryRecord>.from(
            json["xr_img"].map((x) => HistoryRecord.fromJson(x))),
        ctImg: List<HistoryRecord>.from(
            json["ct_img"].map((x) => HistoryRecord.fromJson(x))),
        ratinoscanImages: List<HistoryRecord>.from(
            json["ratinoscan_images"].map((x) => HistoryRecord.fromJson(x))),
        totalCount: json["total_count"],
        xrayImageCount: json["xray_image_count"],
        ctscanImageCount: json["ctscan_image_count"],
        ratinoscanImageCount: json["ratinoscan_image_count"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "xr_img": List<dynamic>.from(xrImg.map((x) => x.toJson())),
        "ct_img": List<dynamic>.from(ctImg.map((x) => x.toJson())),
        "ratinoscan_images":
            List<dynamic>.from(ratinoscanImages.map((x) => x.toJson())),
        "total_count": totalCount,
        "xray_image_count": xrayImageCount,
        "ctscan_image_count": ctscanImageCount,
        "ratinoscan_image_count": ratinoscanImageCount,
      };
}

class HistoryRecord {
  HistoryRecord({
    this.id,
    this.objId,
    this.doctorName,
    this.email,
    this.hospitalName,
    this.hospitalAddress,
    this.patientName,
    this.patientAge,
    this.patientWeight,
    this.patientGender,
    this.patientBloodGroup,
    this.date,
    this.image,
    this.resultImage,
    this.covidPrediction,
    this.confidence,
    this.originalImage,
    this.processedImagePaths,
    this.abnormalities,
  });

  int id;
  int objId;
  String doctorName;
  String email;
  String hospitalName;
  String hospitalAddress;
  String patientName;
  int patientAge;
  int patientWeight;
  String patientGender;
  String patientBloodGroup;
  DateTime date;
  String image;
  String resultImage;
  String covidPrediction;
  String confidence;
  String originalImage;
  List<ProcessedImagePath> processedImagePaths;
  String abnormalities;

  factory HistoryRecord.fromJson(Map<String, dynamic> json) => HistoryRecord(
        id: json["id"],
        objId: json["obj_id"],
        doctorName: json["Doctor_Name"],
        email: json["Email"],
        hospitalName: json["Hospital_Name"],
        hospitalAddress: json["Hospital_Address"],
        patientName: json["Patient_Name"],
        patientAge: json["Patient_age"],
        patientWeight: json["Patient_weight"],
        patientGender: json["Patient_gender"],
        patientBloodGroup: json["Patient_BloodGroup"],
        date: DateTime.parse(json["Date"]),
        image: json["Image"] == null ? null : json["Image"],
        resultImage: json["result_image"] == null ? null : json["result_image"],
        covidPrediction:
            json["COVID_Prediction"] == null ? null : json["COVID_Prediction"],
        confidence: json["confidence"],
        originalImage:
            json["Original_Image"] == null ? null : json["Original_Image"],
        processedImagePaths: json["processedImage_paths"] == null
            ? null
            : List<ProcessedImagePath>.from(json["processedImage_paths"]
                .map((x) => ProcessedImagePath.fromJson(x))),
        abnormalities:
            json["abnormalities"] == null ? null : json["abnormalities"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "obj_id": objId,
        "Doctor_Name": doctorName,
        "Email": email,
        "Hospital_Name": hospitalName,
        "Hospital_Address": hospitalAddress,
        "Patient_Name": patientName,
        "Patient_age": patientAge,
        "Patient_weight": patientWeight,
        "Patient_gender": patientGender,
        "Patient_BloodGroup": patientBloodGroup,
        "Date": date.toIso8601String(),
        "Image": image == null ? null : image,
        "result_image": resultImage == null ? null : resultImage,
        "COVID_Prediction": covidPrediction == null ? null : covidPrediction,
        "confidence": confidence,
        "Original_Image": originalImage == null ? null : originalImage,
        "processedImage_paths": processedImagePaths == null
            ? null
            : List<dynamic>.from(processedImagePaths.map((x) => x.toJson())),
        "abnormalities": abnormalities == null ? null : abnormalities,
      };
}

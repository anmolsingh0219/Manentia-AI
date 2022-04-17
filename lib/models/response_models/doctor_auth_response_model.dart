// To parse this JSON data, do
//
//     final doctorAuthResponseModel = doctorAuthResponseModelFromJson(jsonString);

import 'dart:convert';

DoctorAuthResponseModel doctorAuthResponseModelFromJson(String str) =>
    DoctorAuthResponseModel.fromJson(json.decode(str));

String doctorAuthResponseModelToJson(DoctorAuthResponseModel data) =>
    json.encode(data.toJson());

class DoctorAuthResponseModel {
  DoctorAuthResponseModel({
    this.message,
    this.token,
    this.apiEndPoint,
    this.isRegistered,
  });

  String message;
  String token;
  String apiEndPoint;
  bool isRegistered;

  factory DoctorAuthResponseModel.fromJson(Map<String, dynamic> json) =>
      DoctorAuthResponseModel(
        message: json["message"] == null ? null : json["message"],
        token: json["token"] == null ? null : json["token"],
        apiEndPoint: json["apiEndPoint"] == null ? null : json["apiEndPoint"],
        isRegistered:
            json["isRegistered"] == null ? null : json["isRegistered"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "token": token == null ? null : token,
        "apiEndPoint": apiEndPoint == null ? null : apiEndPoint,
        "isRegistered": isRegistered == null ? null : isRegistered,
      };
}

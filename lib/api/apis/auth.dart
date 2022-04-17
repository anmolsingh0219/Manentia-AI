import 'dart:convert';
import 'dart:io';

import 'package:app/models/response_models/doctor_auth_response_model.dart';
import 'package:app/models/response_models/guest_response_model.dart';
import 'package:app/utilities/log.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthAPI {
  final Dio dio;
  AuthAPI(this.dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<DoctorAuthResponseModel> isDoctorAuthentic(
      String doctorId, String phoneNumber) async {
    String url = '/demo/isDoctorAuthentic';
    try {
      Response response = await dio
          .post(url, data: {"doctorID": doctorId, "phoneNumber": phoneNumber});
      Log.print(response.data.toString(), '$url API Response');
      if (response.statusCode == 200)
        return doctorAuthResponseModelFromJson(jsonEncode(response.data));
      return DoctorAuthResponseModel(
        message: response.statusMessage,
      );
    } catch (e) {
      Log.print(e.toString(), '$url API Error');
      return DoctorAuthResponseModel(
        message: e.toString(),
      );
    }
  }

  Future<GuestResponseModel> storeGuestUser(GoogleSignInAccount account) async {
    String url = '/demo/storeGuestUser';
    try {
      Response response = await dio.post(url, data: {
        "Name": account.displayName,
        "Email": account.email,
        "photoUrl": account.photoUrl,
        "Date": DateTime.now().toString()
      });
      print(response.data['doctorID'].runtimeType);
      Log.print(jsonEncode(response.data), '$url API Response');
      if (response.statusCode == 200)
        return guestResponseModelFromJson(jsonEncode(response.data));
      return null;
    } catch (e) {
      Log.print(e.toString(), '$url API Error');
      return null;
    }
  }
}

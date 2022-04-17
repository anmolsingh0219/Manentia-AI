import 'dart:io';

import 'package:app/utilities/log.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class RegisterAPI {
  final Dio dio;
  RegisterAPI(this.dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<bool> register(String email, String name, String hospitalName,
      String hospitalAddress) async {
    String url = '/demo/mobileRegisterDoctor';
    try {
      Response response = await dio.post(url, data: {
        "mail": email,
        "name": name,
        "hospital_name": hospitalName,
        "hospital_address": hospitalAddress
      });
      Log.print(response.data.toString(), '$url API Response');
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        if (data['message'] == 'success') {
          return true;
        }
      }
      return false;
    } catch (e) {
      Log.print(e.toString(), '$url API Error');
      return false;
    }
  }
}

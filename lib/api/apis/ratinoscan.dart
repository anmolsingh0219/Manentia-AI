import 'dart:convert';
import 'dart:io';

import 'package:app/models/response_models/ratinoscan_response_model.dart';
import 'package:app/utilities/log.dart';
import 'package:app/utilities/dialog_helper.dart';
import 'package:app/utilities/toast.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class RatinoscanAPI {
  final Dio dio;
  RatinoscanAPI(this.dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<RatinoscanResponseModel> ratinoscan(FormData data) async {
    String url = '/ratinoscan/predictAndExtractDR';
    try {
      Response response = await dio.post(url, data: data);
      Log.print(response.data.toString(), '$url API Response');
      if (response.statusCode == 200) {
        if (response.data['tokenValid'] == 'Failed') {
          DialogHelper.showSignoutDialog(response.data['message']);
          return null;
        }
        if (response.data.containsKey('imageValid')) {
          if (response.data['imageValid'] == 'False') {
            Toast.showToast(
                false, 'It seems like you have not uploaded valid image');
            return null;
          }
        }
        return ratinoscanResponseModelFromJson(jsonEncode(response.data));
      }
      Toast.showToast(false, 'Oops! Something went wrong');
      return null;
    } catch (e) {
      Log.print(e.toString(), '$url API Error');
      Toast.showToast(false, 'Oops! Something went wrong');
      return null;
    }
  }
}

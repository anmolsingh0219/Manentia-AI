import 'dart:convert';
import 'dart:io';

import 'package:app/models/response_models/history_response_model.dart';
import 'package:app/utilities/log.dart';
import 'package:app/utilities/shared_prefs.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:app/utilities/dialog_helper.dart';

class DashboardAPI {
  final Dio dio;
  DashboardAPI(this.dio) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<HistoryResponseModel> getDashboardData() async {
    String url = '/demo/getRecordsForDashboard';
    try {
      Response response = await dio.post(url, data: {
        "doctorID": SharedPrefs().doctorID,
        "token": SharedPrefs().authToken
      });
      Log.print(jsonEncode(response.data), '$url API Response');
      if(response.data.containsKey('tokenValid')){
        if (response.data['tokenValid'] == 'Failed') {
          DialogHelper.showSignoutDialog(response.data['message']);
          return null;
        }
      }
      Map<String, dynamic> data = response.data;
      //Processing RatinoScan Images
      List ratinoscans = data['ratinoscan_images'];
      for (var i = 0; i < ratinoscans.length; i++) {
        List outputImages = [];
        List<String> keys = ratinoscans[i].keys.toList();
        keys.forEach((key) {
          if (key != 'Original_Image') {
            if (key.contains('_Image')) {
              outputImages.add({
                'name': key.replaceFirst('_Image', ''),
                'image_path': ratinoscans[i][key]
              });
              ratinoscans[i].remove(key);
            }
          }
        });
        ratinoscans[i]['processedImage_paths'] = outputImages;
      }
      //Processing XRAY Images
      List xrayImages = data['xr_img'];
      for (var i = 0; i < xrayImages.length; i++) {
        List outputImages = [{
          'name': 'Predicted Image',
          'image_path': xrayImages[i]['result_image'],
        },
        {
          'name': 'Lung Segmentation',
          'image_path': xrayImages[i]['Lung_Segmentation'],
        },
        ];
        xrayImages[i]['processedImage_paths'] = outputImages;
      }
      Log.print(jsonEncode(data), 'Processed Data');
      if (response.statusCode == 200) {
        return historyResponseModelFromJson(jsonEncode(data));
      }
      return null;
    } catch (e) {
      Log.print(e.toString(), '$url API Error');
      return null;
    }
  }
}

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class TestAPI {
  test() async {
    Response response;
    var dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    response = await dio.post('https://10.0.2.2:8000/demo/getDoctorInfo',
        data: {"doctorID": "123789456121"});
    print(response.data.toString());
    return response.data.toString();
  }
}

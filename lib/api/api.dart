import 'package:app/api/apis/dashboard.dart';
import 'package:dio/dio.dart';

import 'apis/ratinoscan.dart';
import 'apis/test.dart';
import 'apis/auth.dart';
import 'apis/register.dart';
import 'apis/rayscan.dart';

class API {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.manentia.ai',
    ),
  );

  static TestAPI testAPI = TestAPI();
  static AuthAPI authAPI = AuthAPI(dio);
  static RegisterAPI registerAPI = RegisterAPI(dio);
  static RayscanAPI rayscanAPI = RayscanAPI(dio);
  static DashboardAPI dashboardAPI = DashboardAPI(dio);
  static RatinoscanAPI ratinoscanAPI = RatinoscanAPI(dio);
}

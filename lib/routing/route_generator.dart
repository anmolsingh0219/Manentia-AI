import 'package:app/models/response_models/history_response_model.dart';
import 'package:app/models/response_models/ratinoscan_response_model.dart';
import 'package:app/models/response_models/rayscan_response_model.dart';
import 'package:app/screens/base_screen/base_screen.dart';
import 'package:app/screens/dashboard_screen/all_records_screen.dart';
import 'package:app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:app/screens/intro_slider_screen/intro_slider_screen.dart';
import 'package:app/screens/login_screen/login_screen.dart';
import 'package:app/screens/medical_report_screen/medical_report_screen.dart';
import 'package:app/screens/medical_report_screen/past_medical_record_screen.dart';
import 'package:app/screens/medical_report_screen/ratino_scan_report_screen.dart';
import 'package:app/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:app/screens/products_screen/products_screen.dart';
import 'package:app/screens/ratinoscan_form_screen/ratinoscan_form_screen.dart';
import 'package:app/screens/rayscan_form_screen/rayscan_form_screen.dart';
import 'package:app/screens/sub_products_screen/ratinoscan_sub_products_screen.dart';
import 'package:app/screens/sub_products_screen/rayscan_sub_products_screen.dart';
import 'package:app/screens/scan_screen/scan_screen.dart';
import 'package:app/screens/settings_screen/settings_screen.dart';
import 'package:app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:app/screens/splash_screen/splash_screen.dart';
import 'package:app/utilities/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return GetPageRoute(
          page: () => LoginScreen(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 600),
        );

      case Routes.otpVerificationScreen:
        return GetPageRoute(
          page: () => OTPVerificationScreen(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 600),
        );

      case Routes.introScreen:
        return GetPageRoute(
          page: () => IntroSliderScreen(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 600),
        );

      case Routes.signUpScreen:
        return GetPageRoute(
          page: () => SignUpScreen(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 600),
        );

      case Routes.productsScreen:
        return GetPageRoute(
          page: () => ProductsScreen(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 600),
        );

      case Routes.rayscanSubProductsScreen:
        return GetPageRoute(
          page: () => RayscanSubProductsScreen(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 600),
        );

      case Routes.ratinoscanSubProductsScreen:
        return GetPageRoute(
          page: () => RatinoscanSubProductsScreen(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 600),
        );

      case Routes.baseScreen:
        return GetPageRoute(
          page: () => BaseScreen(),
          transition: Transition.fadeIn,
          transitionDuration: Duration(milliseconds: 600),
        );

      case Routes.splashScreen:
        return GetPageRoute(
          page: () => SplashScreen(),
          transition: Transition.noTransition,
        );

      case Routes.dashboardScreen:
        return GetPageRoute(
          page: () => DashboardScreen(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 600),
        );

      case Routes.scanScreen:
        return GetPageRoute(
          page: () => ScanScreen(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 600),
        );

      case Routes.settingsScreen:
        return GetPageRoute(
          page: () => SettingsScreen(),
          transition: Transition.cupertino,
          transitionDuration: Duration(milliseconds: 600),
        );

      case Routes.rayscanFormScreen:
        {
          RayScanProductType rayScanProductType = settings.arguments;
          return GetPageRoute(
            page: () =>
                RayscanFormScreen(rayScanProductType: rayScanProductType),
            transition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 600),
          );
        }

      case Routes.ratinoscanFormScreen:
        {
          return GetPageRoute(
            page: () => RatinoscanFormScreen(),
            transition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 600),
          );
        }

      case Routes.medicalReportScreen:
        {
          RayScanResponseModel model = settings.arguments;
          return GetPageRoute(
            page: () => MedicalReportScreen(model: model),
            transition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 600),
          );
        }

      case Routes.ratinoscanReportScreen:
        {
          RatinoscanResponseModel model = settings.arguments;
          return GetPageRoute(
            page: () => RatinoscanMedicalReportScreen(model: model),
            transition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 600),
          );
        }

      case Routes.pastMedicalReportScreen:
        {
          List args = (settings.arguments as List);
          HistoryRecord record = args[0];
          ImageType imageType = args[1];

          return GetPageRoute(
            page: () =>
                PastMedicalReportScreen(record: record, imageType: imageType),
            transition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 600),
          );
        }

      case Routes.allRecordsScreen:
        {
          List args = (settings.arguments as List);
          List<HistoryRecord> records = args[0];
          ImageType imageType = args[1];
          return GetPageRoute(
            page: () =>
                AllRecordsScreen(records: records, imageType: imageType),
            transition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 600),
          );
        }
      default:
        return null;
    }
  }

  // static _errorRoute() {
  //   return GetPageRoute(
  //       page: () => Scaffold(
  //             appBar: AppBar(
  //               title: Text('Error'),
  //             ),
  //             body: Center(
  //               child: Text('Error'),
  //             ),
  //           ),
  //       transition: Transition.cupertino);
  // }
}

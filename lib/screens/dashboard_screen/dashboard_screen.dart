import 'dart:math';

import 'package:app/components/circular_loading.dart';
import 'package:app/components/neu_bordered_button.dart';
import 'package:app/controllers/dashboard_controller/dashboard_controller.dart';
import 'package:app/models/response_models/history_response_model.dart';
import 'package:app/routing/routes.dart';
import 'package:app/screens/dashboard_screen/widgets/analytics_item.dart';
import 'package:app/screens/dashboard_screen/widgets/history_record.dart';
import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

enum ImageType { XRAY, CTSCAN, RATINOSCAN }

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = SharedPrefs().isDarkMode;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GetBuilder<DashboardController>(
            init: DashboardController(),
            builder: (controller) {
              if (controller.loading) {
                return Center(
                  child: CircularLoading(color: Get.theme.accentColor),
                );
              }
              return RefreshIndicator(
                onRefresh: () {
                  controller.getDashboardData();
                  return;
                },
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Doctor ID: ' + SharedPrefs().doctorID.toString(),
                        style: Get.textTheme.bodyText1.copyWith(
                            color: isDarkMode
                                ? AppColors.whiteColor.withOpacity(0.5)
                                : AppColors.greyColor),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                              child: AnalyticsItem(
                                  gradient: AppColors.yellowGradient,
                                  title: controller.data.totalCount.toString(),
                                  subtitle: 'Total Images')),
                          const SizedBox(width: 10),
                          Expanded(
                              child: AnalyticsItem(
                                  gradient: AppColors.greenGradient,
                                  title:
                                      controller.data.xrayImageCount.toString(),
                                  subtitle: 'X-Ray Images')),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              child: AnalyticsItem(
                                  gradient: AppColors.blueGradient,
                                  title: controller.data.ctscanImageCount
                                      .toString(),
                                  subtitle: 'CT-Scan Images')),
                          const SizedBox(width: 10),
                          Expanded(
                              child: AnalyticsItem(
                                  gradient: AppColors.redGradient,
                                  title: controller.data.ratinoscanImageCount
                                      .toString(),
                                  subtitle: 'Ratino Images')),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (var i = 0; i < controller.tabs.length; i++)
                            Builder(
                              builder: (context) {
                                if (controller.currentTabIndex == i) {
                                  return NeuBorderedButton(
                                      buttonText: controller.tabs[i],
                                      radius: 30,
                                      onTap: () {});
                                }
                                return TextButton(
                                  onPressed: () {
                                    controller.changeTabIndex(i);
                                  },
                                  child: Text(
                                    controller.tabs[i],
                                    style: Get.textTheme.bodyText2.copyWith(
                                        color: AppColors.greyTextColor),
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
                      SizedBox(height: 10),
                      if (controller.data.xrImg.isEmpty &&
                          controller.data.ctImg.isEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Text(
                            'There are no records to show here',
                            style: Get.textTheme.bodyText1,
                          ),
                        ),
                      if (controller.currentTabIndex == 0)
                        _buildRecordList(ImageType.XRAY, controller.data.xrImg),
                      if (controller.currentTabIndex == 1)
                        _buildRecordList(
                            ImageType.CTSCAN, controller.data.ctImg),
                      if (controller.currentTabIndex == 2)
                        _buildRecordList(ImageType.RATINOSCAN,
                            controller.data.ratinoscanImages),
                      SizedBox(height: 70),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  _buildRecordList(ImageType type, List<HistoryRecord> records) {
    if (records.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Text(
          'There are no records to show here',
          style: Get.textTheme.bodyText1,
        ),
      );
    }
    return Column(
      children: [
        for (var i = 0; i < min(records.length, 3); i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Hero(
              tag: records[i].id.toString(),
              child: HistoryRecordWidget(
                record: records[i],
                imageType: type,
              ),
            ),
          ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.allRecordsScreen,
                      arguments: [records, type]);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    gradient: AppColors.darkBlackGradient,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColorBlack1,
                        offset: Offset(-7, -7),
                        blurRadius: 30,
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: AppColors.shadowColorBlack2.withOpacity(0.75),
                        offset: Offset(14, 14),
                        blurRadius: 40,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child:
                      Center(child: Text('View All', style: TextStyles.grey14)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

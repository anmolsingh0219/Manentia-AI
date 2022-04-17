import 'dart:math';

import 'package:app/models/response_models/history_response_model.dart';
import 'package:app/routing/routes.dart';
import 'package:app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryRecordWidget extends StatelessWidget {
  final HistoryRecord record;
  final ImageType imageType;

  const HistoryRecordWidget(
      {Key key, @required this.record, @required this.imageType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.pastMedicalReportScreen,
            arguments: [record, imageType]);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(record.patientName,
                          style: Get.textTheme.headline6.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor)),
                      Text(
                          '${DateHelper.months[record.date.month - 1]} ${record.date.day}, ${record.date.year}',
                          style: Get.textTheme.bodyText2.copyWith(
                              color: AppColors.greyTextColor, fontSize: 10)),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColors.greyBackgroundColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(record.objId.toString(),
                      style: Get.textTheme.bodyText2
                          .copyWith(color: AppColors.whiteColor)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (imageType != ImageType.RATINOSCAN)
              Row(
                children: [
                  Text(imageType == ImageType.CTSCAN ? 'Disease' : 'Diseases',
                      style: Get.textTheme.bodyText1
                          .copyWith(color: AppColors.greyTextColor)),
                ],
              ),
            if (imageType != ImageType.RATINOSCAN) SizedBox(height: 5),
            if (imageType == ImageType.CTSCAN)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildChip(record.covidPrediction),
                  _buildArrowIcon(),
                ],
              ),
            if (imageType == ImageType.XRAY)
              Builder(builder: (context) {
                List<String> items = record.abnormalities.split(', ');
                List<Widget> children =
                    List.generate(min(items.length, 2), (index) {
                  return _buildChip(items[index]);
                });
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: children,
                      ),
                    ),
                    const SizedBox(width: 5),
                    _buildArrowIcon(),
                  ],
                );
              }),
          ],
        ),
      ),
    );
  }

  Widget _buildArrowIcon() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: AppColors.greyBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Icon(Icons.arrow_forward_rounded, color: AppColors.blackColor65),
      ),
    );
  }

  Widget _buildChip(String text) {
    Random random = new Random();
    int randomNumber = random.nextInt(AppColors.chipColors.length - 1);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.chipColors[randomNumber],
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        text,
        style: Get.textTheme.bodyText2
            .copyWith(fontSize: 10, color: AppColors.whiteColor),
      ),
    );
  }
}

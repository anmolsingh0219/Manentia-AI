import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyticsWidget extends StatelessWidget {
  final String totalImagesScanned;
  final String xRayImagesScanned;
  final String ctScanImagesScanned;
  final String totalRatinoScanned;

  const AnalyticsWidget(
      {Key key,
      @required this.totalImagesScanned,
      @required this.xRayImagesScanned,
      @required this.ctScanImagesScanned,
      @required this.totalRatinoScanned})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.orangeGradient,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    color: AppColors.blackColor,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: Text('Analytics',
                      style: Get.textTheme.bodyText1
                          .copyWith(color: AppColors.whiteColor)),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Images Scanned',
                    style: Get.textTheme.bodyText2
                        .copyWith(color: Colors.white.withOpacity(0.7))),
                Text(totalImagesScanned, style: TextStyles.white18Bold)
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('X-Ray Images Scanned',
                    style: Get.textTheme.bodyText2
                        .copyWith(color: Colors.white.withOpacity(0.7))),
                Text(xRayImagesScanned, style: TextStyles.white18Bold)
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CT-Scan Images Scanned',
                    style: Get.textTheme.bodyText2
                        .copyWith(color: Colors.white.withOpacity(0.7))),
                Text(ctScanImagesScanned, style: TextStyles.white18Bold)
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ratino Images Scanned',
                    style: Get.textTheme.bodyText2
                        .copyWith(color: Colors.white.withOpacity(0.7))),
                Text(totalRatinoScanned, style: TextStyles.white18Bold)
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

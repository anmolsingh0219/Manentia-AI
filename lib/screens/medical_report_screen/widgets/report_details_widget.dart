import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import 'circular_indicator.dart';

class ReportDetailsWidget extends StatelessWidget {
  final List<String> diseases;
  final List<int> percentages;
  final String remarks;

  const ReportDetailsWidget(
      {Key key,
      @required this.diseases,
      @required this.percentages,
      this.remarks})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = SharedPrefs().isDarkMode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Report Details', style: TextStyles.grey18),
        SizedBox(height: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < diseases.length; i++)
              Neumorphic(
                margin: EdgeInsets.only(bottom: 20),
                style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                  color: AppColors.neuBackgroundColor,
                  shadowDarkColor: AppColors.neuDarkColor,
                  shadowLightColor: AppColors.neuLightColor,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    gradient: AppColors.neuBackgroundGradient,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        diseases[i],
                        style: Get.textTheme.bodyText1,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 60,
                          maxWidth: 60,
                        ),
                        child: CircleProgressBar(
                          foregroundColor: AppColors.greenColor,
                          backgroundColor: isDarkMode
                              ? AppColors.blackColor54
                              : AppColors.lightGreyColor,
                          value: percentages[i] / 100,
                          child: Text('${percentages[i]}%',
                              style: Get.textTheme.bodyText2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 10),
            if (remarks != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Remarks: ',
                    style: Get.textTheme.bodyText1,
                  ),
                  Expanded(
                      child: Text(
                    remarks,
                    style: Get.textTheme.bodyText1,
                  )),
                ],
              ),
          ],
        ),
      ],
    );
  }
}

import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class AnalyticsItem extends StatelessWidget {
  final LinearGradient gradient;
  final String title;
  final String subtitle;
  const AnalyticsItem(
      {Key key,
      @required this.gradient,
      @required this.title,
      @required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.neuBackgroundGradient,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(7),
          ),
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                title,
                style: Get.textTheme.headline4.copyWith(
                    fontWeight: FontWeight.w800, color: AppColors.whiteColor),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: Get.textTheme.bodyText2
                    .copyWith(color: AppColors.blackColor54, fontSize: 11),
                maxLines: 1,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
      style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
          shadowDarkColor: AppColors.neuDarkColor,
          shadowLightColor: AppColors.neuLightColor,
          color: AppColors.neuBackgroundColor),
    );
  }
}

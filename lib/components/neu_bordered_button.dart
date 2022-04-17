import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import 'package:app/theme/colors.dart';

class NeuBorderedButton extends StatelessWidget {
  final String buttonText;
  final double radius;
  final VoidCallback onTap;
  const NeuBorderedButton({
    Key key,
    @required this.buttonText,
    @required this.radius,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: EdgeInsets.all(0),
      onPressed: onTap,
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(radius)),
        color: AppColors.neuBackgroundColor,
        shadowDarkColor: AppColors.neuDarkColor,
        shadowLightColor: AppColors.neuLightColor,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.neuGradientBlack1,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              gradient: AppColors.neuGradientBlack2,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Center(
              child: Text(
                buttonText,
                style: Get.textTheme.bodyText2
                    .copyWith(color: AppColors.whiteColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

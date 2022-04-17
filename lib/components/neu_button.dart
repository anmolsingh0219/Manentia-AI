import 'package:app/components/circular_loading.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class NeuButton extends StatelessWidget {
  final String buttonText;
  final double radius;
  final VoidCallback onTap;
  final LinearGradient gradient;
  final bool isLoading;
  const NeuButton({
    Key key,
    @required this.buttonText,
    @required this.radius,
    @required this.onTap,
    @required this.gradient,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = SharedPrefs().isDarkMode;
    return NeumorphicButton(
      padding: EdgeInsets.all(0),
      onPressed: onTap,
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(radius)),
        color: isDarkMode ? AppColors.neuBackgroundColor : null,
        shadowDarkColor: isDarkMode ? AppColors.neuDarkColor : null,
        shadowLightColor: isDarkMode ? AppColors.neuLightColor : null,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: isLoading
              ? CircularLoading()
              : Text(
                  buttonText,
                  style: Get.textTheme.bodyText1
                      .copyWith(color: AppColors.whiteColor),
                ),
        ),
      ),
    );
  }
}

import 'package:app/theme/colors.dart';
import 'package:app/utilities/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'circular_loading.dart';

class ArrowButton extends StatelessWidget {
  final bool isLoading;
  final Function onTap;
  final bool hideArrow;
  final String buttonText;

  const ArrowButton(
      {@required this.buttonText,
      @required this.onTap,
      this.isLoading = false,
      this.hideArrow = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor:
            isLoading ? AppColors.greyColor : AppColors.orangeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: hideArrow
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        children: [
          if (!hideArrow) SizedBox(width: 30),
          Text(
            buttonText,
            style:
                Get.textTheme.bodyText1.copyWith(color: AppColors.whiteColor),
          ),
          if (!hideArrow)
            isLoading
                ? CircularLoading()
                : Container(
                    width: 30,
                    child: SvgPicture.asset(
                      Assets.longArrow,
                    ),
                  ),
        ],
      ),
    );
  }
}

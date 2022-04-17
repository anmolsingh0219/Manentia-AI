import 'package:app/components/expandable_text.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubProductCard extends StatelessWidget {
  final String heading;
  final String description;
  final Function onTap;

  const SubProductCard({
    Key key,
    @required this.heading,
    @required this.description,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
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
          children: [
            Row(
              children: [
                Text(
                  heading,
                  style: Get.textTheme.headline5.copyWith(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ExpandableText(
                    description,
                    textStyle: Get.textTheme.bodyText2
                        .copyWith(color: AppColors.greyTextColor, fontSize: 11),
                  ),
                ),
                _buildArrowIcon(),
              ],
            ),
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
}

import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String heading;
  final String description;
  final Function onTap;
  final String imgPath;
  final String heroTag;

  const ProductCard({
    Key key,
    @required this.heading,
    @required this.description,
    @required this.onTap,
    @required this.imgPath,
    @required this.heroTag,
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
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imgPath,
                errorBuilder: (context, error, stackTrace) {
                  return Placeholder(
                    fallbackHeight: 150,
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: heroTag,
                        child: Text(
                          heading,
                          style: Get.textTheme.headline5.copyWith(
                              fontSize: 20,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              description,
                              style: Get.textTheme.bodyText2.copyWith(
                                  height: 1.5,
                                  color: AppColors.greyTextColor,
                                  fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                if (description != '')
                  IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: heading,
                        titleStyle: TextStyles.white18,
                        middleText: description,
                        middleTextStyle: TextStyles.grey14,
                        backgroundColor: AppColors.neuBackgroundColor,
                        textCancel: 'Okay',
                        cancelTextColor: AppColors.whiteColor,
                      );
                    },
                    icon: Icon(
                      Icons.info_rounded,
                      color: AppColors.whiteColor.withOpacity(0.2),
                      size: 30,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

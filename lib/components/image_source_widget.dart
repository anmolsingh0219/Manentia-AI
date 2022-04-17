import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceWidget extends StatelessWidget {
  final Function(ImageSource) onChanged;
  const ImageSourceWidget({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.neuBackgroundColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  onChanged(ImageSource.camera);
                  Get.back();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt_rounded,
                        color: AppColors.orangeColor),
                    Text(
                      'Camera',
                      style: Get.textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  onChanged(ImageSource.gallery);
                  Get.back();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.image_rounded, color: AppColors.orangeColor),
                    Text(
                      'Gallery',
                      style: Get.textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

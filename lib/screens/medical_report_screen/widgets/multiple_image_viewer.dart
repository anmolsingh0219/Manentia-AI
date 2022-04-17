import 'dart:io';

import 'package:app/api/api.dart';
import 'package:app/models/response_models/ratinoscan_response_model.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/open_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class MultipleImageViewer extends StatefulWidget {
  final String originalImage;
  final bool isOriginalImageFile;
  final List<ProcessedImagePath> outputImages;
  const MultipleImageViewer(
      {Key key,
      @required this.originalImage,
      @required this.outputImages,
      this.isOriginalImageFile = false})
      : super(key: key);

  @override
  _MultipleImageViewerState createState() => _MultipleImageViewerState();
}

class _MultipleImageViewerState extends State<MultipleImageViewer> {
  int selected = 0;

  String fixImagePath(String imagePath) {
    if (!imagePath.contains('/media')) {
      return '/media' +
          (imagePath.substring(0, 1) == '/' ? '' : '/') +
          imagePath;
    }
    return imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  OpenPhoto.openDialog(
                      context,
                      widget.isOriginalImageFile
                          ? FileImage(File(widget.originalImage))
                          : NetworkImage(API.dio.options.baseUrl +
                              fixImagePath(widget.originalImage)),
                      'input-image');
                },
                child: Hero(
                  tag: 'input-image',
                  child: widget.isOriginalImageFile
                      ? Image.file(File(widget.originalImage),
                          errorBuilder: (context, error, stackTrace) {
                          return Placeholder(
                            fallbackHeight: 150,
                          );
                        }, height: 150, fit: BoxFit.cover)
                      : Image.network(
                          API.dio.options.baseUrl +
                              fixImagePath(widget.originalImage),
                          errorBuilder: (context, error, stackTrace) {
                          return Placeholder(
                            fallbackHeight: 150,
                          );
                        }, height: 150, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 10),
              Neumorphic(
                style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                  color: AppColors.neuBackgroundColor,
                  shadowDarkColor: AppColors.neuDarkColor,
                  shadowLightColor: AppColors.neuLightColor,
                ),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: AppColors.neuBackgroundGradient,
                  ),
                  child: Center(
                    child: Text(
                      'Original Image',
                      style: Get.textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Builder(builder: (context) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    OpenPhoto.openDialog(
                        context,
                        NetworkImage(API.dio.options.baseUrl +
                            fixImagePath(
                                widget.outputImages[selected].imagePath)),
                        'output-image');
                  },
                  child: Hero(
                    tag: 'output-image',
                    child: Image.network(
                        API.dio.options.baseUrl +
                            fixImagePath(
                                widget.outputImages[selected].imagePath),
                        errorBuilder: (context, error, stackTrace) {
                      return Placeholder(
                        fallbackHeight: 150,
                      );
                    }, height: 150, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 10),
                Neumorphic(
                  style: NeumorphicStyle(
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                    color: AppColors.neuBackgroundColor,
                    shadowDarkColor: AppColors.neuDarkColor,
                    shadowLightColor: AppColors.neuLightColor,
                  ),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: AppColors.neuBackgroundGradient,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton<int>(
                      value: selected,
                      isExpanded: true,
                      dropdownColor:
                          AppColors.neuBackgroundGradient.colors.first,
                      onChanged: (value) {
                        setState(() {
                          selected = value;
                        });
                      },
                      icon: Icon(Icons.keyboard_arrow_down_rounded,
                          color: Get.theme.accentColor),
                      iconSize: 18,
                      underline: SizedBox(),
                      items: List.generate(
                        widget.outputImages.length,
                        (index) => DropdownMenuItem(
                          child: Text(
                            widget.outputImages[index].name,
                            style: Get.textTheme.bodyText1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          value: index,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}

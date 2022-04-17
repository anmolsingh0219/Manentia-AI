import 'dart:convert';
import 'dart:typed_data';

import 'package:app/api/api.dart';
import 'package:app/controllers/rayscan_controller/rayscan_controller.dart';
import 'package:app/models/response_models/rayscan_response_model.dart';
import 'package:app/utilities/open_photo.dart';
import 'package:flutter/material.dart';

class SingleImageViewer extends StatelessWidget {
  const SingleImageViewer({
    Key key,
    @required this.rayScanController,
    @required this.model,
  }) : super(key: key);

  final RayScanController rayScanController;
  final RayScanResponseModel model;

  Uint8List getBytes(String source) {
    Uint8List bytes = Base64Codec().decode(source);
    return bytes;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              OpenPhoto.openDialog(context,
                  FileImage(rayScanController.pickedImageFile), 'input-image');
            },
            child: Hero(
                tag: 'input-image',
                child: Image.file(rayScanController.pickedImageFile,
                    errorBuilder: (context, error, stackTrace) {
                  return Placeholder(
                    fallbackHeight: 150,
                  );
                }, height: 150)),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () {
              OpenPhoto.openDialog(
                  context,
                  NetworkImage(API.dio.options.baseUrl + model.detectedPath),
                  'output-image');
            },
            child: Hero(
              tag: 'output-image',
              child: Image.network(
                API.dio.options.baseUrl + model.detectedPath,
                errorBuilder: (context, error, stackTrace) {
                  return Placeholder(
                    fallbackHeight: 150,
                  );
                },
                height: 150,
              ),
            ),
          ),
        )
      ],
    );
  }
}

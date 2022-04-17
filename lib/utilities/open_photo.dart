import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class OpenPhoto {
  static void openDialog(
          BuildContext context, ImageProvider provider, String heroTag) =>
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              child: PhotoView(
                tightMode: true,
                imageProvider: provider,
                heroAttributes: PhotoViewHeroAttributes(tag: heroTag),
              ),
            ),
          );
        },
      );
}

import 'dart:io';

import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart';

class ImageHelper {
  static bool validateImage(File image) {
    //Image dimensions should be atleast 200x250
    final size = ImageSizeGetter.getSize(FileInput(image));
    if (size.width < 200 || size.height < 250) {
      return false;
    }
    return true;
  }
}

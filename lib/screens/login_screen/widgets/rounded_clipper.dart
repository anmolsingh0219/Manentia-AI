import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class RoundedClipper extends NeumorphicPathProvider {
  final double height;

  RoundedClipper(this.height);

  @override
  Path getPath(Size size) {
    var path = Path();
    path.lineTo(0.0, height - 150);
    path.quadraticBezierTo(
      size.width / 2,
      height,
      size.width,
      height - 150,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(NeumorphicPathProvider oldClipper) {
    return true;
  }

  @override
  bool get oneGradientPerPath => true;
}

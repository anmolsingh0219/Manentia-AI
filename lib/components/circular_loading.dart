import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  final Color color;
  final double size;

  const CircularLoading({Key key, this.color = Colors.white, this.size = 15})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}

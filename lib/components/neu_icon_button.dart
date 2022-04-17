import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:app/theme/colors.dart';

class NeuIconButton extends StatelessWidget {
  final Widget child;
  final double radius;
  final VoidCallback onTap;
  const NeuIconButton({
    Key key,
    @required this.child,
    @required this.radius,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.neuGradientBlack1,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Container(
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            gradient: AppColors.neuGradientBlack2,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Center(child: child),
        ),
      ),
      onPressed: onTap,
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(radius)),
        color: AppColors.neuBackgroundColor,
        shadowDarkColor: AppColors.neuDarkColor,
        shadowLightColor: AppColors.neuLightColor,
      ),
    );
  }
}

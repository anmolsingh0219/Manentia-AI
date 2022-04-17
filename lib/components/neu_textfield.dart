import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';

class NeuTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Function(String) validator;
  final bool isNumber;
  final Function(String) onChanged;
  const NeuTextField({
    Key key,
    this.controller,
    @required this.hint,
    @required this.validator,
    this.isNumber = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
        color: AppColors.neuBackgroundColor,
        shadowDarkColor: AppColors.neuDarkColor,
        shadowLightColor: AppColors.neuLightColor,
      ),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: AppColors.neuBackgroundGradient,
        ),
        child: TextFormField(
          controller: controller,
          style: TextStyles.white14,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyles.grey14,
            errorStyle: TextStyle(height: 0),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          validator: validator,
          keyboardType: isNumber ? TextInputType.number : null,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

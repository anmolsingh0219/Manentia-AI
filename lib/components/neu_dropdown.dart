import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';

class NeuDropdown extends StatelessWidget {
  final List<String> items;
  final String hint;
  final Function(String) onChanged;
  final Function(String) validator;
  const NeuDropdown({
    Key key,
    @required this.items,
    @required this.onChanged,
    @required this.validator,
    @required this.hint,
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
        child: DropdownButtonFormField(
          onTap: () {
            Get.focusScope.unfocus();
          },
          items: List.generate(
            items.length,
            (index) => DropdownMenuItem(
              child: Text(items[index]),
              value: items[index],
            ),
          ),
          style: TextStyles.white14,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyles.grey14,
            errorStyle: TextStyle(height: 0),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          ),
          dropdownColor: AppColors.neuBackgroundGradient.colors.first,
          onChanged: onChanged,
          validator: validator,
        ),
      ),
    );
  }
}

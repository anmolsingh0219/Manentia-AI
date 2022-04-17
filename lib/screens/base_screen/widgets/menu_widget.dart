import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuWidget extends StatelessWidget {
  final Function(int) onItemClick;

  const MenuWidget({Key key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        gradient: AppColors.blackBackgroundGradient,
      ),
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10),
          Image.asset(Assets.logo, height: 80),
          Text('Manentia AI', style: TextStyles.white18),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(color: AppColors.whiteColor.withOpacity(0.2)),
          ),
          SizedBox(height: 10),
          sliderItem('Home', Icons.home, 0),
          sliderItem('Dashboard', Icons.dashboard_rounded, 1),
          sliderItem('Settings', Icons.settings_rounded, 2),
          Spacer(),
          sliderItem('LogOut', Icons.logout, 3),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget sliderItem(String title, IconData icons, int index) => ListTile(
      title: Text(
        title,
        style: TextStyles.grey14,
      ),
      leading: Icon(
        icons,
        color: AppColors.greyTextColor,
        size: 28,
      ),
      onTap: () {
        onItemClick(index);
      });
}

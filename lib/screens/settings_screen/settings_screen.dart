import 'package:app/screens/settings_screen/widgets/help_desk.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.theme;
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: AppColors.blackBackgroundGradient,
        ),
        child: Column(
          children: [
            SizedBox(height: 70),
            // GetBuilder<ThemeController>(
            //   init: ThemeController(),
            //   builder: (controller) {
            //     return Padding(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             'Dark Mode',
            //             style: Get.theme.textTheme.bodyText1,
            //           ),
            //           NeumorphicSwitch(
            //             height: 30,
            //             onChanged: (value) {
            //               controller.changIsDarkMode(
            //                   value ? ThemeMode.dark : ThemeMode.light);
            //             },
            //             value: controller.mode == ThemeMode.dark,
            //             style: NeumorphicSwitchStyle(
            //               activeTrackColor: AppColors.orangeColor,
            //               inactiveTrackColor: AppColors.greyTextColor,
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // ),
            // Divider(color: AppColors.whiteColor.withOpacity(0.2)),
            ListTile(
              title: Text('Help desk', style: Get.textTheme.bodyText1),
              trailing: Icon(Icons.arrow_forward_ios_rounded,
                  size: 16, color: Get.theme.iconTheme.color),
              onTap: () {
                Get.dialog(HelpDeskDialog());
              },
            ),
            Divider(color: AppColors.whiteColor.withOpacity(0.2)),
            Spacer(),
            Text(
              'From',
              style: Get.textTheme.bodyText2.copyWith(
                color: Get.textTheme.bodyText1.color.withOpacity(0.5),
              ),
            ),
            Text('MANENTIA ADVISORY',
                style: Get.textTheme.bodyText1.copyWith(letterSpacing: 2)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

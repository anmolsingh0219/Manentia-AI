import 'package:app/components/neu_icon_button.dart';
import 'package:app/controllers/menu_controller/menu_controller.dart';
import 'package:app/screens/base_screen/widgets/menu_widget.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<MenuController>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MenuController>().changeScreen(0);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: NeuIconButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 2,
                      width: 10,
                      color: AppColors.greyTextColor,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 2,
                      width: 8,
                      color: AppColors.greyTextColor,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 2,
                      width: 15,
                      color: AppColors.greyTextColor,
                    ),
                  ],
                ),
                radius: 50,
                onTap: () {
                  _scaffoldKey.currentState.openDrawer();
                }),
            title: GetBuilder<MenuController>(
              builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      controller.title,
                      style: Get.textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor),
                    ),
                    if (controller.currentIndex == 0)
                      Text(' BETA',
                          style: Get.textTheme.bodyText2.copyWith(
                              color: AppColors.orangeColor, fontSize: 10)),
                  ],
                );
              },
            ),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: MenuWidget(
              onItemClick: (index) {
                _scaffoldKey.currentState.openEndDrawer();
                controller.changeScreen(index);
              },
            ),
          ),
          extendBodyBehindAppBar: true,
          body: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: AppColors.blackBackgroundGradient,
            ),
            child: GetBuilder<MenuController>(builder: (_) {
              return controller.currentScreen;
            }),
          ),
        ),
      ),
    );
  }
}

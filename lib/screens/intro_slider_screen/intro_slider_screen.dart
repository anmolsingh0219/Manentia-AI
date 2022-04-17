import 'dart:math';

import 'package:app/screens/intro_slider_screen/widgets/intro2.dart';
import 'package:app/screens/intro_slider_screen/widgets/intro3.dart';
import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'widgets/intro1.dart';

class IntroSliderScreen extends StatefulWidget {
  @override
  _IntroSliderScreenState createState() => _IntroSliderScreenState();
}

class ItemData {
  final Color color;
  final String text1;
  final String text2;
  final String text3;

  ItemData(this.color, this.text1, this.text2, this.text3);
}

class _IntroSliderScreenState extends State<IntroSliderScreen> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  List<Widget> widgets = [
    Intro1Widget(),
    Intro2Widget(),
    Intro3Widget(),
  ];

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 20.0,
      child: new Center(
        child: new Material(
          color: AppColors.blackColor,
          type: MaterialType.circle,
          child: new Container(
            width: 5.0 * zoom,
            height: 5.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LiquidSwipe.builder(
            itemCount: widgets.length,
            itemBuilder: (context, index) {
              return widgets[index];
            },
            positionSlideIcon: 0.8,
            slideIconWidget: Icon(Icons.arrow_back_ios_rounded),
            onPageChangeCallback: pageChangeCallback,
            waveType: WaveType.liquidReveal,
            liquidController: liquidController,
            ignoreUserGestureWhileAnimating: true,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(widgets.length, _buildDot),
                ),
              ],
            ),
          ),
          if (page != 2)
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.whiteColor,
                    elevation: 2,
                  ),
                  onPressed: () {
                    liquidController.jumpToPage(page: widgets.length - 1);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyles.black14,
                  ),
                ),
              ),
            ),
          if (page != 2)
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.whiteColor,
                    elevation: 2,
                  ),
                  onPressed: () {
                    liquidController.animateToPage(
                        page: liquidController.currentPage + 1 >
                                widgets.length - 1
                            ? 0
                            : liquidController.currentPage + 1,
                        duration: 700);
                  },
                  child: Text(
                    'Next',
                    style: TextStyles.black14,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}

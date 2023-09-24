import 'package:carousel_slider/carousel_slider.dart';
import 'package:comm/controller/ServerController.dart';
import 'package:comm/controller/UIController.dart';
import 'package:comm/widgets/parentWidget/ParentContainer5.dart';
import 'package:comm/widgets/parentWidget/ParentContainer6.dart';
import 'package:comm/widgets/parentWidget/ParentContainer7.dart';
import 'package:comm/widgets/parentWidget/ParentContainer8.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollColumnTwo extends StatefulWidget {
  final UIController mainUiController;
  double mainHeight;
  double mainWidth;
  ScrollColumnTwo(
      {super.key,
      required this.mainUiController,
      required this.mainHeight,
      required this.mainWidth});

  @override
  State<ScrollColumnTwo> createState() => _ScrollColumnTwoState();
}

class _ScrollColumnTwoState extends State<ScrollColumnTwo> {
  // Duration animationDelay = const Duration(milliseconds: 250);
  // List<double> widgetHeight = [0.7, 0.3, 0.7, 0.3, 0.3, 0.7, 0.3, 0.7];
  // List<double> widgetWidth = [
  //   0.325,
  //   0.325,
  //   0.325,
  //   0.325,
  //   0.325,
  //   0.325,
  //   0.325,
  //   0.325
  // ];
  // List<bool> widgetFS = [
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  // ];
  // bool extendedConnected = false;
  // bool showSideBar = false;
  // bool widgetThreeLg = false;
  // bool widgetFourLg = false;
  // bool speedOFS = false;
  @override
  Widget build(BuildContext context) {
    double height = widget.mainHeight;
    double width = widget.mainWidth;
    return GetBuilder<ServerController>(builder: (controller) {
      return GetBuilder<UIController>(builder: (uiContoller) {
        uiContoller = widget.mainUiController;
        return AnimatedContainer(
          duration: uiContoller.animationDelay,
          height: height,
          width: width * uiContoller.setColumnTwoWidth(),
          child: CarouselSlider(
            items: [
              Container(
                height: height,
                color: Colors.pink,
                child: Column(
                  children: [
                    ParentConatainer5(
                      widget: controller.w5!,
                      widgetID: controller.w5ID!,
                      mainHeight: height,
                      mainWidth: width,
                    ),
                    ParentConatainer6(
                      widget: controller.w6!,
                      widgetID: controller.w6ID!,
                      mainHeight: height,
                      mainWidth: width,
                    ),
                  ],
                ),
              ),

              // ==================== Column 2 Container 2 ====================
              Container(
                height: height,
                color: Colors.blueGrey,
                child: Column(
                  children: [
                    ParentConatainer7(
                      widget: controller.w7!,
                      widgetID: controller.w7ID!,
                      mainHeight: height,
                      mainWidth: width,
                    ),
                    ParentConatainer8(
                      widget: controller.w8!,
                      widgetID: controller.w8ID!,
                      mainHeight: height,
                      mainWidth: width,
                    ),
                  ],
                ),
              ),
            ],
            options: CarouselOptions(
                height: height,
                scrollDirection: Axis.vertical,
                viewportFraction: 1.0,
                scrollPhysics: controller.server!.cilentConnected
                    ? NeverScrollableScrollPhysics()
                    : AlwaysScrollableScrollPhysics()),
          ),
        );
      });
    });
  }
}

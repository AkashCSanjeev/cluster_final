import 'package:comm/controller/UIController.dart';
import 'package:comm/controller/ServerController.dart';
import 'package:comm/widgets/parentWidget/ParentConatiner.dart';
import 'package:comm/widgets/parentWidget/ParentConatiner2.dart';
import 'package:comm/widgets/parentWidget/ParentContainer3.dart';
import 'package:comm/widgets/parentWidget/ParentContainer4.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class ScrollColumnOne extends StatefulWidget {
  final UIController mainUiController;
  double mainHeight;
  double mainWidth;
  ScrollColumnOne(
      {required this.mainUiController,
      required this.mainHeight,
      required this.mainWidth});

  @override
  State<ScrollColumnOne> createState() => _ScrollColumnState();
}

class _ScrollColumnState extends State<ScrollColumnOne> {
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
  // bool widgetOneLg = true;
  // bool widgetTwoLg = true;
  // bool speedOFS = false;
  @override
  Widget build(BuildContext context) {
    double height = widget.mainHeight;
    double width = widget.mainWidth;

    return GetBuilder<ServerController>(builder: (controller) {
      return GetBuilder<UIController>(builder: (uiController) {
        uiController = widget.mainUiController;
        uiController.debugUICOntroller();
        return AnimatedContainer(
          duration: uiController.animationDelay,
          height: height,
          width: width * uiController.setColumnOneWidth(),
          child: CarouselSlider(
            items: [
              Container(
                height: height,
                color: Colors.pink,
                child: Column(
                  children: [
                    ParentConatainer(
                      widget: controller.w1!,
                      widgetID: controller.w1ID!,
                      mainHeight: height,
                      mainWidth: width,
                    ),
                    ParentConatainer2(
                      widget: controller.w2!,
                      widgetID: controller.w2ID!,
                      mainHeight: height,
                      mainWidth: width,
                    ),
                  ],
                ),
              ),
              // ==================== Column 1 Container 2 ====================
              Container(
                height: height,
                color: Colors.blueGrey,
                child: Column(
                  children: [
                    ParentConatainer3(
                      widget: controller.w3!,
                      widgetID: controller.w3ID!,
                      mainHeight: height,
                      mainWidth: width,
                    ),
                    ParentConatainer4(
                      widget: controller.w4!,
                      widgetID: controller.w4ID!,
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

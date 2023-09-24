import 'package:comm/controller/ServerController.dart';
import 'package:comm/controller/UIController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBar extends StatefulWidget {
  final UIController mainUiController;
  double mainHeight;
  double mainWidth;
  SideBar(
      {super.key,
      required this.mainUiController,
      required this.mainHeight,
      required this.mainWidth});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    // UIController uiController = widget.mainUiController;
    double height = widget.mainHeight;
    double width = widget.mainWidth;
    return GetBuilder<ServerController>(builder: (controller) {
      return GetBuilder<UIController>(builder: (uiController) {
        int fullScreen = -1;
        for (var i = 0; i < uiController.widgetFS.length; i++) {
          if (uiController.widgetFS[i] == true) {
            fullScreen = i + 1;
          }
        }
        print(fullScreen);
        return AnimatedContainer(
          duration: uiController.animationDelay,
          height: height,
          width: width * (uiController.showSideBar ? 0.07 : 0),
          child: Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.swapWidget("1", "$fullScreen");
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: fullScreen == 1
                        ? BoxDecoration(
                            border: Border.all(color: Colors.blueAccent))
                        : null,
                    child: Image.asset(controller
                        .getWidgetIcon(controller.getCurrentWidgetId("1"))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.swapWidget("2", "$fullScreen");
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: fullScreen == 2
                        ? BoxDecoration(
                            border: Border.all(color: Colors.blueAccent))
                        : null,
                    child: Image.asset(controller
                        .getWidgetIcon(controller.getCurrentWidgetId("2"))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.swapWidget("5", "$fullScreen");
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: fullScreen == 5
                        ? BoxDecoration(
                            border: Border.all(color: Colors.blueAccent))
                        : null,
                    child: Image.asset(controller
                        .getWidgetIcon(controller.getCurrentWidgetId("5"))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.swapWidget("6", "$fullScreen");
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: fullScreen == 6
                        ? BoxDecoration(
                            border: Border.all(color: Colors.blueAccent))
                        : null,
                    child: Image.asset(controller
                        .getWidgetIcon(controller.getCurrentWidgetId("6"))),
                  ),
                ),
                if (controller.server!.cilentConnected == false) ...[
                  GestureDetector(
                    onTap: () {
                      controller.swapWidget("3", "$fullScreen");
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: fullScreen == 3
                          ? BoxDecoration(
                              border: Border.all(color: Colors.blueAccent))
                          : null,
                      child: Image.asset(controller
                          .getWidgetIcon(controller.getCurrentWidgetId("3"))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.swapWidget("4", "$fullScreen");
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: fullScreen == 4
                          ? BoxDecoration(
                              border: Border.all(color: Colors.blueAccent))
                          : null,
                      child: Image.asset(controller
                          .getWidgetIcon(controller.getCurrentWidgetId("4"))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.swapWidget("7", "$fullScreen");
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: fullScreen == 7
                          ? BoxDecoration(
                              border: Border.all(color: Colors.blueAccent))
                          : null,
                      child: Image.asset(controller
                          .getWidgetIcon(controller.getCurrentWidgetId("7"))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.swapWidget("8", "$fullScreen");
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: fullScreen == 8
                          ? BoxDecoration(
                              border: Border.all(color: Colors.blueAccent))
                          : null,
                      child: Image.asset(controller
                          .getWidgetIcon(controller.getCurrentWidgetId("8"))),
                    ),
                  ),
                ]
              ],
            ),
          ),
        );
      });
    });
  }
}

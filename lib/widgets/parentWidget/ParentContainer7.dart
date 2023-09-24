import 'package:comm/controller/UIController.dart';
import 'package:comm/controller/ServerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ParentConatainer7 extends StatelessWidget {
  final Widget widget;

  final String widgetID;
  final String parentID = "7";
  double mainHeight;
  double mainWidth;
  ParentConatainer7(
      {super.key,
      required this.widget,
      required this.widgetID,
      required this.mainHeight,
      required this.mainWidth});

  @override
  Widget build(BuildContext context) {
    double height = mainHeight;
    double width = mainWidth;
    print("Parent7");
    return GetBuilder<ServerController>(builder: (controller) {
      return DragTarget(
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return GetBuilder<UIController>(builder: (uiController) {
            // return GestureDetector(
            //     // onTap: () => uiCOntroller.toggle(uiCOntroller.oneWidgetLg),
            //     onDoubleTap: () {
            //       print("Tapped $widgetID $parentID ");
            //       controller.handleMessage("$widgetID $parentID d");
            //     },
            //     child: widget);
            controller.parentIsVisible[4] = false;
            controller.parentIsVisible[5] = false;
            controller.parentIsVisible[6] = true;
            controller.parentIsVisible[7] = true;
            print(controller.parentIsVisible);
            return GestureDetector(
              onLongPress: () {
                print("Tapped $widgetID $parentID ");
                controller.handleMessage("$widgetID $parentID d");
              },
              onDoubleTap: () {
                uiController.widgetFS[6] = !uiController.widgetFS[6];
                if (uiController.widgetFS[6] == true) {
                  uiController.widgetHeight[6] = 1.0;
                  uiController.widgetWidth[6] = 0.65;
                  uiController.widgetHeight[7] = 0;
                  uiController.extendedConnected =
                      !uiController.extendedConnected;
                  uiController.showSideBar = true;
                } else if (uiController.widgetFS[6] == false) {
                  uiController.widgetHeight[6] = 0.7;
                  uiController.widgetWidth[6] = 0.325;
                  uiController.widgetHeight[7] = 0.3;
                  uiController.extendedConnected =
                      !uiController.extendedConnected;
                  uiController.showSideBar = false;
                }
                uiController.update();
              },
              onTap: () {
                uiController.widgetFourLg = !uiController.widgetFourLg;

                uiController.widgetHeight[6] =
                    uiController.widgetFourLg ? 0.7 : 0.3;
                uiController.widgetHeight[7] =
                    uiController.widgetFourLg ? 0.3 : 0.7;
                uiController.update();
              },
              child: AnimatedContainer(
                duration: uiController.animationDelay,
                height: height * uiController.widgetHeight[6],
                color: Colors.lightBlue,
                child: widget,
              ),
            );
          });
        },
        onAccept: (String data) {
          if (parentID != data) {
            print('Accepted');
            controller.swapWidget(parentID, data);
          } else {
            print("same $data");
          }
        },
      );
    });
  }
}

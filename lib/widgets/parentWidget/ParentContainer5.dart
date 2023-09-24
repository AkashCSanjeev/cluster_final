import 'package:comm/controller/UIController.dart';
import 'package:comm/controller/ServerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ParentConatainer5 extends StatelessWidget {
  final Widget widget;

  final String widgetID;
  final String parentID = "5";
  double mainHeight;
  double mainWidth;
  ParentConatainer5(
      {super.key,
      required this.widget,
      required this.widgetID,
      required this.mainHeight,
      required this.mainWidth});

  @override
  Widget build(BuildContext context) {
    double height = mainHeight;
    double width = mainWidth;
    print("Parent5");
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
            controller.parentIsVisible[4] = true;
            controller.parentIsVisible[5] = true;
            controller.parentIsVisible[6] = false;
            controller.parentIsVisible[7] = false;
            print(controller.parentIsVisible);
            return GestureDetector(
              onLongPress: () {
                print("Tapped $widgetID $parentID ");
                controller.handleMessage("$widgetID $parentID d");
              },
              onDoubleTap: () {
                uiController.widgetFS[4] = !uiController.widgetFS[4];
                if (uiController.widgetFS[4] == true) {
                  uiController.widgetHeight[4] = 1.0;
                  uiController.widgetWidth[4] = 0.65;
                  uiController.widgetHeight[5] = 0;
                  uiController.extendedConnected =
                      !uiController.extendedConnected;
                  uiController.showSideBar = true;
                } else if (uiController.widgetFS[4] == false) {
                  uiController.widgetHeight[4] = 0.7;
                  uiController.widgetWidth[4] = 0.325;
                  uiController.widgetHeight[5] = 0.3;
                  uiController.extendedConnected =
                      !uiController.extendedConnected;
                  uiController.showSideBar = false;
                }
                uiController.update();
              },
              onTap: () {
                uiController.widgetThreeLg = !uiController.widgetThreeLg;

                uiController.widgetHeight[4] =
                    uiController.widgetThreeLg ? 0.7 : 0.3;
                uiController.widgetHeight[5] =
                    uiController.widgetThreeLg ? 0.3 : 0.7;
                uiController.update();
              },
              child: AnimatedContainer(
                duration: uiController.animationDelay,
                height: height * uiController.widgetHeight[4],
                color: Colors.orange,
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

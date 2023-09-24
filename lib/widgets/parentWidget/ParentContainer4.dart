import 'package:comm/controller/UIController.dart';
import 'package:comm/controller/ServerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ParentConatainer4 extends StatelessWidget {
  final Widget widget;

  final String widgetID;
  final String parentID = "4";
  double mainHeight;
  double mainWidth;
  ParentConatainer4(
      {super.key,
      required this.widget,
      required this.widgetID,
      required this.mainHeight,
      required this.mainWidth});

  @override
  Widget build(BuildContext context) {
    double height = mainHeight;
    double width = mainWidth;
    print("Parent4");
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
            controller.parentIsVisible[0] = false;
            controller.parentIsVisible[1] = false;
            controller.parentIsVisible[2] = true;
            controller.parentIsVisible[3] = true;
            print(controller.parentIsVisible);
            return GestureDetector(
              onLongPress: () {
                print("Tapped $widgetID $parentID ");
                controller.handleMessage("$widgetID $parentID d");
              },
              onDoubleTap: () {
                uiController.widgetFS[3] = !uiController.widgetFS[3];
                if (uiController.widgetFS[3] == true) {
                  uiController.widgetHeight[3] = 1.0;
                  uiController.widgetWidth[3] = 0.65;
                  uiController.widgetHeight[2] = 0;
                  uiController.extendedConnected =
                      !uiController.extendedConnected;
                  uiController.showSideBar = true;
                } else if (uiController.widgetFS[3] == false) {
                  uiController.widgetHeight[3] = 0.7;
                  uiController.widgetWidth[3] = 0.325;
                  uiController.widgetHeight[2] = 0.3;
                  uiController.extendedConnected =
                      !uiController.extendedConnected;
                  uiController.showSideBar = false;
                }
                uiController.update();
              },
              onTap: () {
                uiController.widgetTwoLg = !uiController.widgetTwoLg;

                uiController.widgetHeight[3] =
                    uiController.widgetTwoLg ? 0.3 : 0.7;
                uiController.widgetHeight[2] =
                    uiController.widgetTwoLg ? 0.7 : 0.3;
                uiController.update();
              },
              child: AnimatedContainer(
                duration: uiController.animationDelay,
                height: height * uiController.widgetHeight[3],
                color: Colors.indigo,
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

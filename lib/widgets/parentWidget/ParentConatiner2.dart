import 'package:comm/controller/UIController.dart';
import 'package:comm/controller/ServerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ParentConatainer2 extends StatelessWidget {
  final Widget widget;

  final String widgetID;
  final String parentID = "2";
  double mainHeight;
  double mainWidth;
  ParentConatainer2(
      {super.key,
      required this.widget,
      required this.widgetID,
      required this.mainHeight,
      required this.mainWidth});

  @override
  Widget build(BuildContext context) {
    double height = mainHeight;
    double width = mainWidth;
    print("Parent2");
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
            controller.parentIsVisible[0] = true;
            controller.parentIsVisible[1] = true;
            controller.parentIsVisible[2] = false;
            controller.parentIsVisible[3] = false;
            print(controller.parentIsVisible);
            return GestureDetector(
              onLongPress: () {
                print("Tapped $widgetID $parentID ");
                controller.handleMessage("$widgetID $parentID d");
              },
              onDoubleTap: () {
                // setState(
                //   () {
                uiController.widgetFS[1] = !uiController.widgetFS[1];
                if (uiController.widgetFS[1] == true) {
                  uiController.widgetHeight[1] = 1.0;
                  uiController.widgetWidth[1] = 0.65;
                  uiController.widgetHeight[0] = 0;
                  uiController.extendedConnected =
                      !uiController.extendedConnected;
                  uiController.showSideBar = true;
                } else if (uiController.widgetFS[1] == false) {
                  uiController.widgetHeight[1] = 0.7;
                  uiController.widgetWidth[1] = 0.325;
                  uiController.widgetHeight[0] = 0.3;
                  uiController.extendedConnected =
                      !uiController.extendedConnected;
                  uiController.showSideBar = false;
                }
                //   },
                // );
                uiController.update();
              },
              onTap: () {
                uiController.widgetOneLg = !uiController.widgetOneLg;
                // setState(() {
                uiController.widgetHeight[1] =
                    uiController.widgetOneLg ? 0.3 : 0.7;
                uiController.widgetHeight[0] =
                    uiController.widgetOneLg ? 0.7 : 0.3;
                // });
                uiController.update();
              },
              child: AnimatedContainer(
                duration: uiController.animationDelay,
                height: height * uiController.widgetHeight[1],
                color: Colors.cyan,
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

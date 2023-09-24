import 'package:comm/controller/UIController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// typedef MapCallback = void Function(bool value);

class SpeedOMeterWidget extends StatefulWidget {
  double mainHeight;
  double mainWidth;
  SpeedOMeterWidget({super.key,required this.mainHeight,required this.mainWidth});

  @override
  State<SpeedOMeterWidget> createState() => _SpeedOMeterWidgetState();
}

class _SpeedOMeterWidgetState extends State<SpeedOMeterWidget> {
  @override
  Widget build(BuildContext context) {
    double height = widget.mainHeight;
    double width = widget.mainWidth;
    print("Seepdo height $height width $width");

    return GetBuilder<UIController>(builder: (uiController) {
      uiController.debugUICOntroller();
      return GestureDetector(
        onHorizontalDragEnd: (details) {
          int sensi = 500;
          double velocity = details.primaryVelocity!;
          if (velocity > sensi) {
            setState(() {
              uiController.speedOFS = true;
              uiController.showSideBar = false;
            });
            uiController.update();
          } else if (velocity < -sensi) {
            setState(() => uiController.speedOFS = false);
            uiController.update();
          }
        },
        child: AnimatedContainer(
          duration: uiController.animationDelay,
          color: Colors.red,
          height: height,
          width: width * (uiController.speedOFS ? 1.0 : 0.35),
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.black,
            child: Center(
              child: Text(
                "Odo",
                style: TextStyle(color: Colors.white),
              ),
            ),
            margin: const EdgeInsets.all(5),
          ),
        ),
      );
    });
  }
}

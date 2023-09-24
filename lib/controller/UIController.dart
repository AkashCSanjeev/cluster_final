import 'package:get/get.dart';

class UIController extends GetxController {
  bool widgetOneLg = true;
  bool widgetTwoLg = true;
  bool widgetThreeLg = false;
  bool widgetFourLg = false;
  bool speedOFS = false;
  Duration animationDelay = const Duration(milliseconds: 250);
  bool extendedConnected = false;
  bool showSideBar = false;
  List<double> widgetHeight = [0.7, 0.3, 0.7, 0.3, 0.3, 0.7, 0.3, 0.7];
  List<double> widgetWidth = [
    0.325,
    0.325,
    0.325,
    0.325,
    0.325,
    0.325,
    0.325,
    0.325
  ];

  List<bool> widgetFS = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  double setColumnOneWidth() {
    // print("speedOFS width 1- $speedOFS");
    if (widgetFS[0] || widgetFS[1] || widgetFS[2] || widgetFS[3]) {
      return 0.58;
    } else if (speedOFS ||
        widgetFS[4] ||
        widgetFS[5] ||
        widgetFS[6] ||
        widgetFS[7]) {
      return 0;
    } else
      return 0.325;
  }

  double setColumnTwoWidth() {
    // print("speedOFS width 2- $speedOFS");
    if (widgetFS[4] || widgetFS[5] || widgetFS[6] || widgetFS[7]) {
      return 0.58;
    } else if (speedOFS ||
        widgetFS[0] ||
        widgetFS[1] ||
        widgetFS[2] ||
        widgetFS[3]) {
      return 0;
    } else
      return 0.325;
  }

  void debugUICOntroller() {
    // print("Server");
    // print("widgetOneLg - $widgetOneLg");
    // print("widgetTwoLg - $widgetTwoLg");
    // print("widgetThreeLg - $widgetThreeLg");
    // print("widgetFourLg - $widgetFourLg");
    // print("speedOFS - $speedOFS");
    // print("extendedConnected - $extendedConnected");
    // print("showSideBar - $showSideBar");
    // print("widgetHeight - $widgetHeight");
    // print("widgetWidth - $widgetWidth");
    // print("widgetFS - $widgetFS");
    // print("================================================");
  }
}

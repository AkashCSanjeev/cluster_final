import 'dart:io';
import 'dart:typed_data';
import 'package:comm/server.dart';
import 'package:comm/widgets/usableWidget/BatteryWidget.dart';
import 'package:comm/widgets/usableWidget/DocumentWidget.dart';
import 'package:comm/widgets/usableWidget/NavWidget.dart';
import 'package:comm/widgets/usableWidget/RideStatus.dart';
import 'package:comm/widgets/usableWidget/RiderProfileWidget.dart';
import 'package:comm/widgets/usableWidget/SpotifyWidget.dart';
import 'package:comm/widgets/usableWidget/TripWidget.dart';
import 'package:comm/widgets/usableWidget/WeatherWidget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';

class ServerController extends GetxController {
  Server? server;
  List<String> serverLogs = [];
  TextEditingController messageController = TextEditingController();
  Widget? w1 = SpotifyWidget();
  String? w1ID = SpotifyWidget.id;
  String? w1ParentID = "1";
  Widget? w2 = BatteryWidget();
  String? w2ID = BatteryWidget.id;
  String? w2ParentID = "2";
  Widget? w3 = NavWidget();
  String? w3ID = NavWidget.id;
  String? w3ParentID = "3";
  Widget? w4 = WeatherWidget();
  String? w4ID = WeatherWidget.id;
  String? w4ParentID = "4";
  Widget? w5 = TripWidget();
  String? w5ID = TripWidget.id;
  String? w5ParentID = "5";
  Widget? w6 = DocumentWidget();
  String? w6ID = DocumentWidget.id;
  String? w6ParentID = "6";
  Widget? w7 = RideStatusWidget();
  String? w7ID = RideStatusWidget.id;
  String? w7ParentID = "7";
  Widget? w8 = RiderProfileWidget();
  String? w8ID = RiderProfileWidget.id;
  String? w8ParentID = "7";
  static bool isConnected = false;
  String? ip = "null";

  List<bool> parentIsVisible = [
    true,
    true,
    false,
    false,
    true,
    true,
    false,
    false,
  ];

  List<String> clientParentId = ["1", "2", "5", "6"];

  @override
  void onInit() {
    // TODO: implement onInit
    server = Server(OnData, onError);
    print("Controller INit");
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      switch (result) {
        case ConnectivityResult.wifi:
          print("Wifi");

          startOrStopServer();
          isConnected = true;
          break;
        default:
          if (server!.running) {
            startOrStopServer();
          }

          print("Default");
      }
    });

    super.onInit();
  }

  Future<void> startOrStopServer() async {
    final info = NetworkInfo();
    ip = await info.getWifiIP();
    print("NetworkIp : $ip");

    if (server != null && server!.running) {
      await server!.close();
      serverLogs.clear();
      print("Connection Closed");
    } else {
      print("$isConnected isconnected");
      if (isConnected) {
        await server!.start(ip!);
        print("Connected to $ip");
      } else {
        print("else startOrStopServer");
      }
    }
    update();
  }

  void OnData(Uint8List data) {
    String receviedData = String.fromCharCodes(data);

    List splitData = receviedData.split(" ");
    print("Split data : ${splitData[0]} ${splitData[1]} ${splitData[2]}");

    if (splitData[2].toString() == "c") {
      print("Ack data : ${getCurrentWidgetId(splitData[1])} ${splitData[1]}");
      int parentId = 0;
      for (var i = 0; i < parentIsVisible.length; i++) {
        if (parentIsVisible[i] == false) {
          handleMessage(
              "${getCurrentWidgetId("${i + 1}")} ${clientParentId[parentId]} a");
          sleep(Duration(milliseconds: 1000));
          parentId++;
        }
      }
    }

    if (splitData[2].toString() == "d") {
      print("Ack data : ${getCurrentWidgetId(splitData[1])} ${splitData[1]}");
      handleMessage(
          "${getCurrentWidgetId(splitData[1].toString())} ${splitData[1]} a");
    }
    setWidget(
        splitData[1], getWidget(splitData[0]), splitData[0], splitData[1]);
    serverLogs.add(receviedData);
    print(serverLogs);
    update();
  }

  void onError(dynamic error) {
    debugPrint("Error: $error");
  }

  void handleMessage(String msg) {
    server!.broadcast(msg);

    serverLogs.add(msg);
    update();
  }

  Widget getWidget(String id) {
    switch (id) {
      case "1":
        return SpotifyWidget();
      case "2":
        return BatteryWidget();
      case "3":
        return NavWidget();
      case "4":
        return WeatherWidget();
      case "5":
        return TripWidget();
      case "6":
        return DocumentWidget();
      case "7":
        return RideStatusWidget();
      case "8":
        return RiderProfileWidget();
      default:
        return const Text("Error Occured");
    }
  }

  String getWidgetIcon(String id) {
    switch (id) {
      case "1":
        return 'images/musicIcon.png';
      case "2":
        return 'images/batteryInfoIcon.png';
      case "3":
        return 'images/mapIcon.png';
      case "4":
        return "images/weatherIcon.png";
      case "5":
        return 'images/tripIcon.png';
      case "6":
        return 'images/documentIcon.png';
      case "7":
        return 'images/rideStatusIcon.png';
      case "8":
        return 'images/riderProfileIcon.png';
      default:
        return 'images/riderProfileIcon.png';
    }
  }

  String getCurrentWidgetId(String pos) {
    switch (pos) {
      case "1":
        return w1ID!;
      case "2":
        return w2ID!;
      case "3":
        return w3ID!;
      case "4":
        return w4ID!;
      case "5":
        return w5ID!;
      case "6":
        return w6ID!;
      case "7":
        return w7ID!;
      case "8":
        return w8ID!;
      default:
        print("IN getCurrentWidget default");
        return "error";
    }
  }

  void setWidget(String pos, Widget w, String widgetID, String parentID) {
    switch (pos) {
      case "1":
        w1 = w;
        w1ID = widgetID;
        w1ParentID = pos;
        break;
      case "2":
        w2 = w;
        w2ID = widgetID;
        w2ParentID = pos;
        break;
      case "3":
        w3 = w;
        w3ID = widgetID;
        w3ParentID = pos;
        break;
      case "4":
        w4 = w;
        w4ID = widgetID;
        w4ParentID = pos;
        break;
      case "5":
        w5 = w;
        w5ID = widgetID;
        w5ParentID = pos;
      case "6":
        w6 = w;
        w6ID = widgetID;
        w6ParentID = pos;
        break;
      case "7":
        w7 = w;
        w7ID = widgetID;
        w7ParentID = pos;
        break;
      case "8":
        w8 = w;
        w8ID = widgetID;
        w8ParentID = pos;
        break;
      default:
        print("Inside Set Widget Deafult");
    }
    update();
  }

  void swapWidget(String parentId1, String parentId2) {
    print("swap $parentId1 and $parentId2");

    String w1ID = getCurrentWidgetId(parentId1);
    String w2ID = getCurrentWidgetId(parentId2);
    dynamic tempw1 = getWidget(w1ID);
    dynamic tempw2 = getWidget(w2ID);
    tempw1.parentId = parentId2;
    tempw2.parentId = parentId1;

    print("Before swap");
    debug();
    setWidget(parentId1, tempw2, w2ID, parentId2);
    print("Intermidiate");
    debug();
    setWidget(parentId2, tempw1, w1ID, parentId1);
    print("After swap");
    debug();

    // w1 = getWidget(ID2);
    // w2 = getWidget(ID1);

    // w1ID = ID2;
    // w2ID = ID1;

    update();
  }

  void debug() {
    print("Parent and IDs");
    print("================================");
    print("w1 parent $w1ParentID");
    print("w2 parent $w2ParentID");
  }
}

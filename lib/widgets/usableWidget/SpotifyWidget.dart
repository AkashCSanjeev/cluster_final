import 'package:comm/controller/ServerController.dart';
import 'package:comm/controller/UIController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpotifyWidget extends StatelessWidget {
  SpotifyWidget({
    super.key,
  });

  static String id = "1";
  String parentId = "1";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServerController>(builder: (controller) {
      print("Spotify ${controller.w1ParentID}");
      return GetBuilder<UIController>(builder: (uiCOntroller) {
        return Stack(
          children: [
            GetBuilder<UIController>(builder: (uiCOntroller) {
              return Container(
                height: double.maxFinite,
                color: Colors.black,
                margin: const EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    "Spotify",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }),
            Center(
              child: Draggable(
                data: parentId,
                feedback: Container(
                  height: 300,
                  width: 300,
                  color: Colors.black,
                  margin: const EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      "Spotify",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                childWhenDragging:Container(
                  height: 300,
                  width: 300,
                  color: Colors.blueGrey,
                  margin: const EdgeInsets.all(5),
                  
                ) ,
                child: Container(
                  width: 100,
                  height: 100,
                  color: const Color.fromARGB(0, 255, 193, 7),
                ),
              ),
            )
          ],
        );
      });
    });
  }
}

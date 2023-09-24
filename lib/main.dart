import 'package:comm/ScrollColumnOne.dart';
import 'package:comm/ScrollColumnTwo.dart';
import 'package:comm/SideBar.dart';
import 'package:comm/SpeedOMeter.dart';
import 'package:comm/controller/UIController.dart';
import 'package:comm/controller/ServerController.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Server'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  ServerController serverController = ServerController();
  // Timer? _timer;
  var networkStatus;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    networkStatus.cancel();
  }

  @override
  @override
  Widget build(BuildContext context) {
    // print("height $height width $width");
    // print("Main");
    double height = MediaQuery.of(context).size.height - 36;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ServerController>(
          init: ServerController(),
          builder: (controller) {
            print(controller.serverLogs);
            return GetBuilder<UIController>(
                init: UIController(),
                builder: (uiController) {
                  // uiController.debugUICOntroller();
                  return Center(
                    child: Row(
                      children: [
                        SpeedOMeterWidget(mainHeight: height,mainWidth: width,),
                        ScrollColumnOne(
                          mainUiController: uiController,
                          mainHeight: height,
                          mainWidth: width,
                        ),
                        ScrollColumnTwo(mainUiController: uiController,mainHeight: height,mainWidth: width,),
                        SideBar(mainUiController: uiController,mainHeight: height,mainWidth: width,)
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }

  void startStopServer() async {}
}

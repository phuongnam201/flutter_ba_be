import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_babe/routes/router_help.dart';
import 'package:flutter_babe/utils/dimension.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  // Future<void> _loadResource() async {
    
  // }

  
  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(
      Duration(seconds: 3),
      () => Get.offNamed(RouteHelper.getMenuPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: Dimensions.splashImg,
              ),
            ),
          ),
          Center(
            // child: Image.asset(
            //   "assets/image/.png",
            //   width: Dimensions.splashImg,
            // ),
            child: Text("Ba Be Tourism",
            style: TextStyle(fontSize: Dimensions.font16),
            ),
          ),
        ],
      ),
    );
  }
}
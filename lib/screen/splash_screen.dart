import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_data/controller/controller.dart';
import '../constant/constant.dart';

class SplashScreen extends GetView<SplashController> {
  static const pageId = "/splash";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal,
        child: Center(
            child: Image.asset(
          ImagePath.appIcon,
          width: 100,
          height: 100,
        )),
      ),
    );
  }
}

import 'dart:io';
import 'package:get/get.dart';

class Common {

  static bool get isAndroid => Platform.isAndroid;

  static bool get isIOS => Platform.isIOS;

  static bool isNull(dynamic item) => item == null;

  static void getSnackBar(String title, String description,
      {int duration = 2, SnackPosition position = SnackPosition.BOTTOM}) {
    Get.snackbar(title, description,
        snackPosition: position, duration: Duration(seconds: duration));
  }
}
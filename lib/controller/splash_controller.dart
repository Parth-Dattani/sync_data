import 'dart:async';
import 'package:get/get.dart';
import '../screen/screen.dart';
import 'controller.dart';

class SplashController extends BaseController {

  @override
  void errorHandler(e) {}
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), goToLogin);
    super.onInit();
  }

  void goToLogin() async {
    return await loadingWrapper(() async {
      return Get.offAndToNamed(HomeScreen.pageId);
    });
  }
}

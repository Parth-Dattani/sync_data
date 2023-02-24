

import 'package:get/get.dart';

import '../controller/controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SignupController>(SignupController(), permanent: true);
  }
}

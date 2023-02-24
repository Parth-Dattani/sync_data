import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;


import '../screen/screen.dart';
import 'base_controller.dart';

class LoginController extends BaseController {

  RxBool hidePassword = true.obs;
  final passwordTextController = TextEditingController();


//  bool _passwordVisible = false.obs();

  @override
  void errorHandler(e) {}



  void doLogin(String email, String pass) async {
    print("success");
    return await loadingWrapper(() async {
      // var res = await loginUser(email, pass);
      // if(res != null){
      //   return Get.offAndToNamed(HomeScreen.pageId);
      // }
    });
  }
}

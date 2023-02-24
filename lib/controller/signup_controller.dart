import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../screen/screen.dart';
import '../services/remot_services.dart';
import 'base_controller.dart';

class SignupController extends BaseController {
  RxBool hidePassword = true.obs;
  final passwordTextController = TextEditingController();

  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final signup = GlobalKey<FormState>();

  @override
  void errorHandler(e) {}

  // void doSignup(String user, String firstName, String lastName,String email,String password,String phone ) async {
  //   print("success");
  //   return await loadingWrapper(() async {
  //     var res = await registerUser(user, firstName, lastName, email, password, phone);
  //     if(res != null){
  //       return Get.offAndToNamed(HomeScreen.pageId);
  //     }
  //   });
  // }


  void registerAPI() async {
    try {
      var response = await RemoteServices.registerAPI(
          userNameController.text,
          //firstNameController.text,
          //lastNameController.text,
          emailController.text,
          passwordController.text,
      //    phoneController.text
      );
      // loading.value = false;
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        var data = jsonData;
        print("dat Register: ${data}");
        // for (var m in data) {
        //   //if(data != dModel){
        //   await DatabaseHandler().addProduct(ProductModel.fromJson(m));
        //   //}
        //   print("model pfata : ${pModel}");
        // }

      }

      // DatabaseHandler().add(DataModel(
      //   firstName: jsonData[],
      //   lastName: controller.lnameController.text,
      // )).whenComplete(() => Get.back());
      //}
    } catch (e) {
      print("Error catch : $e");
    }

  }


}

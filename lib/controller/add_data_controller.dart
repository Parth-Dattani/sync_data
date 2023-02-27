import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_data/utils/extension.dart';
import '../Model/model_class.dart';
import '../Model/user_model.dart';

class AddDataController extends GetxController {
  final myForm = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  RxBool isUpdate = false.obs;
  Rx<DataModel> data = DataModel().obs;
  Rx<UserModel> userData = UserModel().obs;
  dynamic argumentData = Get.arguments;
  RxInt online = 0.obs;

  @override
  void onInit() {
    isUpdate.value = argumentData['isUpdate'];
    if (isUpdate.value == true) {
      userData.value = Get.arguments['data'];
      fNameController.text = userData.value.name.defaultStringValue();
      lNameController.text = userData.value.email.defaultStringValue();
      //fNameController.text = data.value.firstName.defaultStringValue();
      //lNameController.text = data.value.lastName.defaultStringValue();
      print("Show Data ${jsonEncode(userData.value)}");
    } else {
      print("ADD");
      uidFunction();
      //print("Add data id : ${ Random().nextInt(666666)}");
      print("Add data id :${uidFunction()}");
    }
    super.onInit();
  }


  //genrate unique 6Int Id
  num uidFunction() {
    num randomString = Random().nextInt(555654);
    return randomString;
  }
}

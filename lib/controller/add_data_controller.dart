import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_data/utils/extension.dart';
import '../Model/model_class.dart';

class AddDataController extends GetxController {
  final myForm = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  RxBool isUpdate = false.obs;
  Rx<DataModel> data = DataModel().obs;
  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    isUpdate.value = argumentData['isUpdate'];
    if (isUpdate.value == true) {
      data.value = Get.arguments['data'];
      fNameController.text = data.value.firstName.defaultStringValue();
      lNameController.text = data.value.lastName.defaultStringValue();
      print("Show Data ${jsonEncode(data.value)}");
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

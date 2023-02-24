import 'dart:convert';
import 'package:get/get.dart';
import 'package:sync_data/Model/user_model.dart';

import '../Database/dbhelper.dart';
import '../Model/model_class.dart';
import '../Model/product_model.dart';
import '../services/remot_services.dart';

class HomeController extends GetxController {
  RxBool connected = false.obs;

  RxList<DataModel> dModel = <DataModel>[].obs;
  RxList<ProductModel> pModel = <ProductModel>[].obs;
  RxList<UserModel> uModel = <UserModel>[].obs;
  final load = false.obs;
  RxString name = "".obs;
  RxString id = "".obs;

  @override
  void onInit() {
    getOffData();
    super.onInit();
  }

  getOffData() async {
    load(true);
    dModel.value = await DatabaseHandler().retriveAllTask();
    pModel.value = await DatabaseHandler().retriveAllProduct();
    uModel.value = await DatabaseHandler().retriveAllUser();
    load(false);
  }

  void getData() async {
    try {
      var response = await RemoteServices.dataApi();
      // loading.value = false;
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        var data = jsonData['Items'] as List;
        for (var model in data) {
          //if(data != dModel){
            await DatabaseHandler().add(DataModel.fromJson(model));
          //}
          print("model dfata : ${dModel}");
        }

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

  void getProductData() async {
    try {
      var response = await RemoteServices.getProductData();
      // loading.value = false;
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        var data = jsonData;
        for (var m in data) {
          //if(data != dModel){
          await DatabaseHandler().addProduct(ProductModel.fromJson(m));
          //}
          print("model pfata : ${pModel}");
        }

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

  void getUserData() async {
    try {
      var response = await RemoteServices.getUserData();
      // loading.value = false;
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        var data = jsonData['data'] as List;
        for (var m in data) {
          //if(data != dModel){
          await DatabaseHandler().addUser(UserModel.fromJson(m));
          //}
          print("model pfata : ${uModel}");
        }

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


  // void deleteDat(int id)async{
  //   DatabaseHandler().deleteTask(
  //       //dModel[index].firstName.toString(),
  //       //snapshot.data![index].id!.toInt());
  //   //setState(() {
  //     DatabaseHandler().deleteUser(p);
  //   //});
  //   getAllTask();
  // }
}

import 'package:get/get.dart';
import 'package:sync_data/controller/add_data_controller.dart';

class AddDataBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<AddDataController>(AddDataController(), permanent: false);
  }
}
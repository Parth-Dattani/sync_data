import 'package:connectivity/connectivity.dart';

import 'package:get/get.dart';

import '../widgets/common.dart';



abstract class BaseController extends GetxController{

  RxBool _isLoading = false.obs;

  RxBool get isLoading => this._isLoading;

  final Connectivity _connectivity = Connectivity();

  Future<void> loadingWrapper(Future<void> Function() function) async {
    ConnectivityResult connectivityResult =
    await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Common.getSnackBar('Error'.tr, 'no_connectivity'.tr);
      return;
    }
    if (_isLoading.value) {
      return;
    }
    try {
      _toggleLoading();
      await function();
    } catch (e) {
      errorHandler(e);
    } finally {
      _toggleLoading();
    }
  }

  void errorHandler(dynamic e);

  void _toggleLoading() {
    this._isLoading.value = !this._isLoading.value;
  }
}
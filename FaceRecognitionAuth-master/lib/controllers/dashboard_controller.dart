import 'package:face_net_authentication/controllers/auth_controller.dart';
import 'package:face_net_authentication/model/request_confirm_login.dart';
import 'package:face_net_authentication/model/response_confirm_login.dart';
import 'package:face_net_authentication/services/GetControllers.dart';
import 'package:face_net_authentication/services/api_url.dart';
import 'package:face_net_authentication/services/core_services.dart';
import 'package:face_net_authentication/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  AuthController signInController =
  GetControllers.shared.getSignInController();

  TextEditingController numberController = TextEditingController();

  var responseConfirmLogin = ResponseConfirmLogin().obs;

  @override
  void onInit() {

    signInController.getLocationPermission();

    confirmLogin();

    super.onInit();
  }

  onTapNext() {
    if (numberController.text.isEmpty) {
      ToastUtils.showError("Please enter mobile number");
    } else if (numberController.text.length != 11) {
      ToastUtils.showError("Please enter 11 digits mobile number");
    } else {
      debugPrint("Submit button tapped");
      //checkUser();
    }
  }

  confirmLogin() async {

    RequestConfirmLogin requestActivateUser = RequestConfirmLogin();
    requestActivateUser.empKey = signInController.responseCheckUser.value.empKey;
    requestActivateUser.lat = signInController.lat.toString();
    requestActivateUser.lon = signInController.lon.toString();
    requestActivateUser.mobile = signInController.responseCheckUser.value.mobile;

    var data = await CoreService().postWithoutAuth(
        url: signInController.responseCheckUser.value.apiLocation! + confirmLoginUrl,
        body: requestActivateUser.toJson());

    if (data == null) {
    } else {
      // try {
      var response = ResponseConfirmLogin.fromJson(data);
      responseConfirmLogin.value = response;
    }
  }

  clearInputs() {
    numberController.clear();
  }
}

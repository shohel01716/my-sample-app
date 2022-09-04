import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:face_net_authentication/strings/network_label.dart';
import 'package:face_net_authentication/whitelhr.dart';

class ToastUtils {


  static showSuccess(String msg) {
    Fluttertoast.showToast(
      timeInSecForIosWeb: 3,
      msg: msg,
      backgroundColor: Colors.green,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static showInternetError() {
    showError(NetworkLabel.connectionErrorMessage);
  }

  static showError(String msg) {
    Fluttertoast.showToast(
      timeInSecForIosWeb: 3,
      msg: msg,
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }


}
class LoadingUtils {
  static show(String msg){
    Get.isDialogOpen ?? true
        ? const Offstage()
        : Get.defaultDialog(title: "Please wait",
        content: Center(
          child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h,),
                  const CircularProgressIndicator(color: Colors.lightBlue),
                  SizedBox(height: 20.h,),
                  Text(msg),
                ],
              ),
            ),
        ),
        barrierDismissible: false);
  }

  static hide(){
    if (Get.isDialogOpen ?? false) Get.back();
  }
}

class SnackBarUtils {

  showSuccess(String msg) {
    Get.snackbar(NetworkLabel.success, msg, snackPosition: SnackPosition.TOP, backgroundColor: Colors.green, colorText: Colors.white);
  }

  showCartAddSuccess(String msg) {
    Get.snackbar(NetworkLabel.successOnCart, msg, snackPosition: SnackPosition.TOP, backgroundColor: Colors.green, colorText: Colors.white);
  }
  showAlreadyInCart(String msg) {
    Get.snackbar(NetworkLabel.alreadyOnCart, msg, snackPosition: SnackPosition.TOP, backgroundColor: Colors.green, colorText: Colors.white);
  }

  showError(String msg) {
    Get.snackbar(NetworkLabel.error, msg, snackPosition: SnackPosition.TOP, backgroundColor: Colors.red, colorText: Colors.white);
  }

  showAttention(String msg) {
    Get.snackbar(NetworkLabel.attention, msg, snackPosition: SnackPosition.TOP, backgroundColor: Colors.red, colorText: Colors.white);
  }


}


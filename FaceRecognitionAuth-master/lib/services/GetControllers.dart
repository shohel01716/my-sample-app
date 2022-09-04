// ignore_for_file: file_names, unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:face_net_authentication/controllers/auth_controller.dart';
import 'package:face_net_authentication/controllers/dashboard_controller.dart';
import 'package:face_net_authentication/strings/hive_string.dart';

class GetControllers {
  static final GetControllers _singleton = GetControllers._internal();
  final Box hive = Hive.box(HiveString.hiveName);
  factory GetControllers() {
    return _singleton;
  }

  GetControllers._internal();

  static GetControllers get shared => _singleton;



  //Controller initialize
  AuthController getSignInController() {
    if (!Get.isRegistered<AuthController>()) {
      Get.put(AuthController());
    }
    return Get.find<AuthController>();
  }

  DashboardController getDashboardController() {
    if (!Get.isRegistered<DashboardController>()) {
      Get.put(DashboardController());
    }
    return Get.find<DashboardController>();
  }
  //getToken

  getToken() {
    var token = hive.get(HiveString.token);
    return token;
  }

  /*Future<bool> checkRefreshToken() async {
    //
    if (isTokenNeedRefresh()) {
      return await callAPIRefreshToken(); //true/ false
    } else {
      debugPrint("token is OK, no need refresh");
      return true; //true
    }
  }
*/
  isTokenNeedRefresh() {
    var currentTime = DateTime.now();
    var expireDateBack = hive.get("expireDate"); //fake data
    // var currentTime = convertDateFromString('2022-06-28 09:59:00');//fake data
    debugPrint(currentTime.toString());
    debugPrint(expireDateBack.toString());
    debugPrint("start compare");
    debugPrint(
        "remain in minutes: ${expireDateBack.difference(currentTime).inMinutes.toString()}");
    bool needRefresh = expireDateBack.difference(currentTime).inMinutes <
        180; //check if expire in 3hrs then refresh it
    debugPrint("needRefresh $needRefresh");
    return needRefresh;
  }

  Future saveToken(String token) async {
    debugPrint("saveToken:: "+token);
    await hive.put(HiveString.token, token);
    debugPrint("done saveToken ");
  }

  convertDateFromString(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);
    return todayDate;
  }

}

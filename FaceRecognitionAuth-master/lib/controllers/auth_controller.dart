import 'dart:convert';

import 'package:face_net_authentication/app/text_styles.dart';
import 'package:face_net_authentication/strings/network_label.dart';
import 'package:face_net_authentication/styles/styles.dart';
import 'package:face_net_authentication/widget/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:face_net_authentication/locator.dart';
import 'package:face_net_authentication/model/request_activate_user.dart';
import 'package:face_net_authentication/model/request_check_user.dart';
import 'package:face_net_authentication/model/response_activate_user.dart';
import 'package:face_net_authentication/model/response_check_user.dart';
import 'package:face_net_authentication/pages/home.dart';
import 'package:face_net_authentication/pages/sign-in.dart';
import 'package:face_net_authentication/pages/sign-up.dart';
import 'package:face_net_authentication/router/route_constants.dart';
import 'package:face_net_authentication/screen/authentication/activation_screen.dart';
import 'package:face_net_authentication/screen/authentication/signup_selfie.dart';
import 'package:face_net_authentication/services/api_url.dart';
import 'package:face_net_authentication/services/camera.service.dart';
import 'package:face_net_authentication/services/core_services.dart';
import 'package:face_net_authentication/services/face_detector_service.dart';
import 'package:face_net_authentication/services/ml_service.dart';
import 'package:face_net_authentication/utils/snackbar_utils.dart';

class AuthController extends GetxController {
  TextEditingController numberController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  var responseCheckUser = ResponseCheckUser().obs;
  var isTakenSelfie = false.obs;
  double lat = 0.0;
  double lon = 0.0;

  var localPredictedData = [].obs;
  var localImage = "".obs;

  @override
  void onInit() {
    debugLogin();
    getLocationPermission();
    super.onInit();
  }

  //face detection
  MLService _mlService = locator<MLService>();
  FaceDetectorService _mlKitService = locator<FaceDetectorService>();
  CameraService _cameraService = locator<CameraService>();
  bool loading = false;

  _initializeServices() async {
    await _cameraService.initialize();
    await _mlService.initialize();
    _mlKitService.initialize();
  }

  debugLogin() {
    //numberController.text = "01844476978";
    numberController.text = "01844476974";
  }

  void getLocationPermission() async {
    await Permission.location.request();
    //await Permission.camera.request();

    getLatLon();
  }

  Location location = Location();

  getLatLon() async {
    LocationData locationData;

    /*_permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }*/

    locationData = await location.getLocation();

    if (locationData.isMock!) {
      debugPrint("========locationData.isMock========");
    } else {
      debugPrint("Lat:: " +
          locationData.latitude.toString() +
          " ===lon::" +
          locationData.longitude.toString());
      lat = locationData.latitude!;
      lon = locationData.longitude!;
    }
  }

  onTapNext() {
    getLocationPermission();

    if (lat == 0) {
      ToastUtils.showError(NetworkLabel.mockLocationError);
      return;
    }

    if (numberController.text.isEmpty) {
      ToastUtils.showError("Please enter mobile number");
    } else if (numberController.text.length != 11) {
      ToastUtils.showError("Please enter 11 digits mobile number");
    } else {
      debugPrint("Submit button tapped");
      checkUser();
    }
  }

  checkUser() async {
    LoadingUtils.show("Mobile number checking..");

    RequestCheckUser requestCheckUser = RequestCheckUser();
    requestCheckUser.mobile = numberController.text;
    requestCheckUser.version = "5";

    var data = await CoreService()
        .postWithoutAuth(url: checkUserUrl, body: requestCheckUser.toJson());

    LoadingUtils.hide();

    if (data == null) {
    } else {
      // try {
      var results = ResponseCheckUser.fromJson(data);
      responseCheckUser.value = results;

     /* debugPrint("remoteData ::" +
          responseCheckUser.value.imgData.toString().toString());

      List<double> stringList = (jsonDecode(
                  "[0.0017663165926933289,0.009652489796280861,-0.007543032057583332,0.002548759337514639,0.00030872580828145146,-0.05814167484641075,0.2385266274213791,0.2845217287540436,-0.09386884421110153,0.10527044534683228,0.00432823458686471,0.004583313129842281,0.00013702872092835605,-0.002220801543444395,-0.0011640482116490602,-0.09678402543067932,-0.0001778969308361411,0.009636294096708298,-0.0021863861475139856,-0.012033221311867237,0.07469342648983002,0.002087188884615898,-0.014090043492615223,-0.00226938771083951,0.042950339615345,0.006210956256836653,0.004409212153404951,0.036083467304706573,0.15120074152946472,0.1258062720298767,-0.0036277815233916044,0.0111343739554286,0.010705194436013699,0.005482160951942205,0.08136595785617828,0.09633055329322815,-0.15625372529029846,-0.0042229644022881985,-0.0034982177894562483,0.009393362328410149,-0.0030751116573810577,-0.00040412714588455856,-0.0014818839263170958,-0.0037877114955335855,0.013919991441071033,0.030172128230333328,-0.06206097453832626,0.14809122681617737,0.006125930231064558,-0.007312247063964605,-0.10682521015405655,-0.0028220575768500566,-0.002696543000638485,0.00468858378008008,0.21390953660011292,0.012057514861226082,0.002293681027367711,-0.0016742049483582377,-0.0017774509033188224,-0.015523341484367847,0.021070284768939018,-0.01373374368995428,-0.08920455724000931,0.042723603546619415,0.01073758490383625,-0.30862054228782654,-0.001031953957863152,-0.015223725698888302,0.002595321275293827,-0.0000029358211577346083,-0.001002093660645187,0.0005364743992686272,-0.026058483868837357,0.010162646882236004,-0.0534449927508831,0.0004453749570529908,-0.0030913071241229773,0.0013280271086841822,-0.11641291528940201,0.037670623511075974,0.008502612821757793,0.0319698229432106,-0.00023306268849410117,0.09710793197154999,0.005915388930588961,0.00017827650299295783,0.005607675760984421,0.13221967220306396,0.0018412205390632153,0.05849797651171684,0.012251860462129116,-0.003583243815228343,0.0017015347257256508,0.02280319668352604,-0.23217801749706268,-0.06931653618812561,-0.030706578865647316,-0.08298549801111221,0.0015739955706521869,0.012478596530854702,-0.003200626466423273,0.005591480061411858,-0.0015547635266557336,0.0008851827005855739,0.003986105788499117,0.004316088277846575,0.04097449406981468,0.0004291794903110713,-0.008713153190910816,-0.008478319272398949,0.20393313467502594,0.0008543101139366627,-0.000018314780390937813,0.12962840497493744,0.005194691475480795,0.10436350107192993,-0.007000484503805637,-0.032277535647153854,-0.0397760309278965,-0.19810277223587036,0.1631205976009369,-0.03676367923617363,0.07961684465408325,-0.00041500848601572216,-0.0006878006388433278,0.00524327764287591,0.002119579818099737,0.003463802393525839,0.000071487738750875,-0.019337370991706848,-0.005980170797556639,-0.007478250190615654,-0.005397134460508823,-0.07825642824172974,-0.0013118316419422626,-0.005486209411174059,-0.026738692075014114,-0.015175139531493187,-0.01983943022787571,-0.012365228496491909,-0.00423106225207448,-0.0032795791048556566,-0.005992317572236061,-0.22362680733203888,0.0836981013417244,-0.1172550767660141,-0.0042229644022881985,-0.0006306104478426278,0.00870505627244711,0.0012095979182049632,0.013515105471014977,-0.03345980495214462,0.14614777266979218,0.008599785156548023,0.003182406537234783,-0.00413591368123889,0.017750216647982597,-0.010235526598989964,-0.07074173539876938,-0.003880835371091962,0.00627168919891119,0.00018219884077552706,-0.0007454969454556704,-0.0027673980221152306,-0.001757206628099084,-0.0013077828334644437,-0.005878949537873268,0.15029379725456238,0.005336401518434286,0.0011883412953466177,-0.1245754212141037,0.029961587861180305,-0.00278359348885715,0.11602422595024109,-0.01731293834745884,-0.003117624670267105,-0.06105685606598854,-0.005223033484071493,-0.0038423712830990553,-0.0051501537673175335,0.03295774757862091,-0.042820777744054794,0.0030953558161854744,0.0006220065988600254,-0.12489933520555496,-0.318208247423172,-0.009336678311228752,-0.006700868718326092,-0.02607467956840992,-0.020211925730109215,-0.008567394688725471,0.0036318302154541016]")
              as List<dynamic>)
          .cast<double>();

      //List remoteData = responseCheckUser.value.imgData.toString();
      debugPrint("remoteData Size::" + stringList.length.toString());*/

      if (responseCheckUser.value.status == "3") {
        ToastUtils.showError(responseCheckUser.value.statusDetails!);
      } else if (responseCheckUser.value.status == "21") {
        ToastUtils.showSuccess(responseCheckUser.value.statusDetails!);
      }
      if (responseCheckUser.value.status == "101") {
        //ToastUtils.showSuccess(responseCheckUser.value.statusDetails!);
        Get.to(() => const ActivationScreen());
      } else if (responseCheckUser.value.status == "107") {
        //ToastUtils.showSuccess(responseCheckUser.value.statusDetails!);
        Get.toNamed(enterPin);
      }
      /* }catch (e) {
        debugPrint("Exception::: "+e.toString());
      }*/
    }
  }

  onTapSelfie() async {
    Get.to(() => SignUpSelfie(
          isSignup: true,
        ));
  }

  onTapActivation() {
    getLocationPermission();

    if (lat == 0) {
      ToastUtils.showError("Please enable your phone location and try again");
      return;
    }

    if (localPredictedData.value.isEmpty) {
      ToastUtils.showError("Please take a selfie first then press next button");
    } else if (pinController.text.isEmpty) {
      ToastUtils.showError("Please enter pin number");
    } else if (pinController.text.length != 4) {
      ToastUtils.showError("Please enter 4 digits pin number");
    } else {
      debugPrint("Submit button tapped");
      activationRequest();
    }
  }

  activationRequest() async {
    LoadingUtils.show("Activation Request Sending..");

    RequestActivateUser requestActivateUser = RequestActivateUser();
    requestActivateUser.empKey = responseCheckUser.value.empKey;
    requestActivateUser.lat = lat.toString();
    requestActivateUser.lon = lon.toString();
    requestActivateUser.pinNumber = pinController.text;
    requestActivateUser.imageData =
        jsonEncode(localPredictedData.value).toString();

    var data = await CoreService().postWithoutAuth(
        url: responseCheckUser.value.apiLocation! + activateUserUrl,
        body: requestActivateUser.toJson());

    LoadingUtils.hide();

    if (data == null) {
    } else {
      // try {
      var response = ResponseActivateUser.fromJson(data);

      if (response.status == 1) {
        ToastUtils.showSuccess(response.statusDet.toString());
      } else {
        ToastUtils.showError(response.statusDet.toString());
      }

      //clearInputs();

      Get.offNamed(signIn);
    }
  }

  clearInputs() {
    pinController.clear();
    //numberController.clear();
  }

  void onTapPinValidation() {
    debugPrint("next button tapped");

    if (pinController.text.isEmpty) {
      ToastUtils.showError("Please enter pin number");
    } else if (pinController.text.length != 4) {
      ToastUtils.showError("Please enter 4 digits pin number");
    } else if (pinController.text == responseCheckUser.value.accessPin) {
      ToastUtils.showSuccess("Login Successful");
      Get.offAllNamed(dashboard);
    } else {
      ToastUtils.showError("Pin number not matched! Try again");
    }
  }

  void onTapFaceLogin() {
    Get.to(() => SignUpSelfie(isSignup: false));
  }

  void onTapLogout() {
    Get.defaultDialog(
        title: "",
        content: Padding(
          padding: const EdgeInsets.only(bottom: 15.0, left: 15, right: 15),
          child: Text("Are you sure want to logout?", style: AppTextStyles.customTitle),
        ),
        confirm: CustomButtons.fillButton(
          onPressed: () {
            Get.offAllNamed(signIn);
          },
          name: 'Yes',
          height: 40,width: 100
        ),
        cancel: Padding(
          padding: const EdgeInsets.only(bottom: 15.0, right: 15),
          child: CustomButtons.stokeButton(
              onPressed: () {
                Get.back();
              },
              name: 'No',
              height: 40,width: 100,
              radius: 15
          ),
        ),
        onConfirm: () {
          Get.offAllNamed(signIn);
        },
        onCancel: (){
          Get.back();
        },
        barrierDismissible: false);
  }
}

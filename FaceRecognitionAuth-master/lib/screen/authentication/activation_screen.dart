

import 'dart:io';

import 'package:face_net_authentication/app/app_labels.dart';
import 'package:face_net_authentication/app/assets.dart';
import 'package:face_net_authentication/app/colors.dart';
import 'package:face_net_authentication/controllers/auth_controller.dart';
import 'package:face_net_authentication/locator.dart';
import 'package:face_net_authentication/services/GetControllers.dart';
import 'package:face_net_authentication/services/camera.service.dart';
import 'package:face_net_authentication/services/face_detector_service.dart';
import 'package:face_net_authentication/services/ml_service.dart';
import 'package:face_net_authentication/styles/text_styles.dart';
import 'package:face_net_authentication/widget/custom_appbar_widget.dart';
import 'package:face_net_authentication/widget/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ActivationScreen extends StatefulWidget {
  const ActivationScreen({Key? key}) : super(key: key);

  @override
  State<ActivationScreen> createState() => _ActivationScreenState();
}

class _ActivationScreenState extends State<ActivationScreen> {

  final AuthController signInController =
      GetControllers.shared.getSignInController();

  MLService _mlService = locator<MLService>();
  FaceDetectorService _mlKitService = locator<FaceDetectorService>();
  CameraService _cameraService = locator<CameraService>();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  _initializeServices() async {
    setState(() => loading = true);
    await _cameraService.initialize();
    await _mlService.initialize();
    _mlKitService.initialize();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBar(
        widgets: appbarWidget(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              userImageWidget(),
              SizedBox(height: 10.h),

              textView("EMP ID: ", signInController.responseCheckUser.value.empId.toString()),
              textView("Name: ", signInController.responseCheckUser.value.name.toString()),
              textView("Designation: ", signInController.responseCheckUser.value.designationShort.toString()),
              textView("Mobile: ", signInController.responseCheckUser.value.mobile.toString()),

              SizedBox(height: 30.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 120.w),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    controller: signInController.pinController,
                    //Controller for the form field
                    keyboardType: TextInputType.number,
                    //Keyboard type for the form field
                    autofocus: false,
                    //Autofocus for the form field
                    maxLines: 1,
                    maxLength: 4,
                    textAlign: TextAlign.center,
                   // cursorColor: Colors.blueGrey,
                    decoration: const InputDecoration(
                      labelText: "Pin Number",
                      counterText: "",
                      labelStyle: TextStyle(color: Colors.blueGrey),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                          width: 2.0,
                        ),
                      ),
                    ),
                    obscureText: true, //Fill color for the form field
                  ),
                ),
              ),

              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 120.w),
                child: Column(
                  children: [
                    CustomButtons.fillButton(
                      onPressed: () {
                        signInController.onTapSelfie();
                      },
                      name: 'Take Selfie',
                      height: 60,
                    ),
                    SizedBox(height: 20.h),
                    CustomButtons.fillButton(
                      onPressed: () {
                        signInController.onTapActivation();
                      },
                      name: 'Next',
                      height: 60,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100.h),

              Text(
                AppLabels.appDomain,
                style: AppTextStyles.title2
                    .copyWith(fontSize: 20.sp, color: AppColors.blueGrey),
              ),
              SizedBox(height: 20.h),
              Image.asset(
                Assets.fhLogo,
                width: 150.h,
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget appbarWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButtons.backButton(),
          Text(
            'Activation Request',
            style: AppTextStyles.headline1.copyWith(
              fontSize: 24.sp,
              color: AppColors.white,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }

  Widget userImageWidget() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 4.w,
          color: AppColors.blueGrey,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Obx(()=> signInController.localImage.value.isNotEmpty ? Image.file(
          File(signInController.localImage.value),
          fit: BoxFit.cover,
          width: 130.h,
          height: 130.h,
        ): Image.network(
          Assets.profileImage,
          fit: BoxFit.cover,
          width: 130.h,
          height: 130.h,
        ),
      ),
    ));
  }

  textView(String title, String value) {

    return Card(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Row(
          children: [
            Expanded(child: Text(title+value, style: AppTextStyles.customTitle, maxLines: 2)),
          ],
        ),
      ),
    );
  }

}

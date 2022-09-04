
import 'package:get/get.dart';
import 'package:face_net_authentication/controllers/auth_controller.dart';
import 'package:face_net_authentication/locator.dart';
import 'package:face_net_authentication/services/GetControllers.dart';
import 'package:face_net_authentication/services/camera.service.dart';
import 'package:face_net_authentication/services/face_detector_service.dart';
import 'package:face_net_authentication/services/ml_service.dart';
import 'package:face_net_authentication/whitelhr.dart';
import 'package:face_net_authentication/widget/custom_appbar_widget.dart';
import 'package:face_net_authentication/widget/custom_text_field.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({Key? key}) : super(key: key);

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> {

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
  void dispose() {
    signInController.clearInputs();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBar(
        widgets: appbarWidget(),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              Assets.logo,
              width: 180.w,
            ),
            const Spacer(),
            SizedBox(height: 10.h),
            Text(
              AppLabels.enterYourPin,
              textAlign: TextAlign.start,
              style: AppTextStyles.title2
                  .copyWith(fontSize: 20.sp, color: AppColors.blueGrey),
            ),
            SizedBox(height: 10.h),
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
                    labelText: "",
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
            SizedBox(height: 50.h),
            CustomButtons.fillButton(
              onPressed: () {

                signInController.onTapPinValidation();
              },
              name: 'Next',
              height: 60,
            ),
            SizedBox(height: 20.h),
            CustomButtons.stokeButton(
              onPressed: () {
                signInController.onTapFaceLogin();
              },
              name: 'Face Login',
              height: 60,
            ),
            SizedBox(height: 100.h),
            const Spacer(),
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
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Welcome',
                style: AppTextStyles.headline1.copyWith(
                    fontSize: 22.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w300),
              ),
              Text(
                signInController.responseCheckUser.value.name.toString(),
                style: AppTextStyles.headline1
                    .copyWith(fontSize: 22.sp, color: AppColors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}

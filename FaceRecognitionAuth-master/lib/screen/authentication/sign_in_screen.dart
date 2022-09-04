

import 'package:face_net_authentication/controllers/auth_controller.dart';
import 'package:face_net_authentication/services/GetControllers.dart';
import 'package:face_net_authentication/whitelhr.dart';
import 'package:face_net_authentication/widget/custom_appbar_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final AuthController signInController =
      GetControllers.shared.getSignInController();

  @override
  void initState() {
    signInController.getLocationPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAppBar(
        widgets: appbarWidget(),
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              Assets.logo,
              width: 180.w,
            ),
            const Spacer(),
            SizedBox(height: 10.h),
            Text(
              AppLabels.whatIsNumber,
              textAlign: TextAlign.start,
              style: AppTextStyles.title2
                  .copyWith(fontSize: 20.sp, color: AppColors.blueGrey),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Container(
                color: Colors.white,
                child: TextFormField(
                  controller: signInController.numberController,
                  //Controller for the form field
                  keyboardType: TextInputType.number,
                  //Keyboard type for the form field
                  autofocus: false,
                  //Autofocus for the form field
                  maxLines: 1,
                  maxLength: 11,
                  decoration: const InputDecoration(
                    labelText: "",
                    counterText: "",
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
                  obscureText: false, //Fill color for the form field
                ),
              ),
            ),
            SizedBox(height: 50.h),
            CustomButtons.fillButton(
              onPressed: () {
                signInController.onTapNext();
              },
              name: 'Next',
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
          Text(
            'Sign In',
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
}

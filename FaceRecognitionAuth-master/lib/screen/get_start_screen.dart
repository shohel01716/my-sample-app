/*                                     *\
          **File Created By**
      name:- Shuoib Hossain Badon
      time:- Aug 13, 2022 4:23 PM
      contract:-shuibe873@gmail.com
\*                                     */

import 'package:hive_flutter/hive_flutter.dart';
import 'package:face_net_authentication/strings/hive_string.dart';
import 'package:face_net_authentication/whitelhr.dart';
import 'package:get/get.dart';

class GetStartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.splash,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(Assets.background, fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,),
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(Assets.background))),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    const Spacer(),
                    Image.asset(
                      Assets.logo,
                      width: 200.w,
                    ),
                    SizedBox(height: 50.h),
                    Text(
                      AppLabels.smartlyMange,
                      style: AppTextStyles.headline2.copyWith(fontSize: 22.sp),
                    ),
                    SizedBox(height: 200.h),
                    const Spacer(),
                    CustomButtons.fillButton(
                      onPressed: () {
                        setGetStartShowAlready();
                        Get.offNamed(signIn);
                      },
                      name: 'Get Started',
                      height: 60,
                    ),
                    SizedBox(height: 40.h),
                    conditionTextWidget(),
                    SizedBox(height: 20.h),
                    Text(
                      AppLabels.appDomain,
                      style: AppTextStyles.title2.copyWith(fontSize: 20.sp),
                    ),
                    SizedBox(height: 20.h),
                    Image.asset(
                      Assets.fhLogo,
                      width: 150.h,
                    ),
                    SizedBox(height: 40.h),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  RichText conditionTextWidget() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'By proceeding further you are agreeing with our \n',
          style: AppTextStyles.headline1,
          children: [
            TextSpan(
              text: 'Terms & Conditions ',
              style: AppTextStyles.headline1
                  .copyWith(color: AppColors.blue, fontSize: 19.sp),
            ),
            TextSpan(
              text: 'and ',
              style: AppTextStyles.headline1,
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: AppTextStyles.headline1
                  .copyWith(color: AppColors.blue, fontSize: 19.sp),
            ),
          ]),
    );
  }

  var box = Hive.box(HiveString.hiveName);

   setGetStartShowAlready() {
    box.put(HiveString.first, true);
  }

}

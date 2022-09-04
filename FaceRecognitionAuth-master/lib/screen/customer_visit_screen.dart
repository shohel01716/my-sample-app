

import 'package:get/get.dart';
import 'package:face_net_authentication/whitelhr.dart';
import 'package:face_net_authentication/widget/custom_appbar_widget.dart';

class CustomerVisitScreen extends StatelessWidget {
  const CustomerVisitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteDeep,
      body: CustomAppBar(
        widgets: appbarWidget(),
        height: 150.h,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            const Spacer(),
            customerWidget(),
            SizedBox(height: 100.h),
            const Spacer(),
            domainWidget(),
          ],
        ),
      ),
    );
  }

  Widget domainWidget() {
    return Column(
      children: [
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
    );
  }

  Widget customerWidget() {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      elevation: 10,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Text(
                'Customer Details',
                style: AppTextStyles.title1.copyWith(color: AppColors.blueGrey),
              ),
            ),
            Divider(
              color: AppColors.blueGrey,
              thickness: 2.h,
            ),
            SizedBox(height: 10.h),
            AppTextFieldStyles.normal(
                controller: CustomTextFieldController(), hint: 'Contact Number'),
            SizedBox(height: 20.h),
            AppTextFieldStyles.normal(
                controller: CustomTextFieldController(), hint: 'Customer Number'),
            SizedBox(height: 20.h),
            AppTextFieldStyles.normal(
                controller: CustomTextFieldController(), hint: 'Company'),
            SizedBox(height: 20.h),
            AppTextFieldStyles.normal(
                controller: CustomTextFieldController(), hint: 'Product'),
            SizedBox(height: 30.h),
            SizedBox(width: 150.w,child: CustomButtons.fillButton(onPressed: () {}, name: 'Next')),
          ],
        ),
      ),
    );
  }

  Widget appbarWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 50.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButtons.backButton(title: 'Customer Visit'),
          Image.asset(
            Assets.logoWhite,
            width: 150.w,
          ),
        ],
      ),
    );
  }
}

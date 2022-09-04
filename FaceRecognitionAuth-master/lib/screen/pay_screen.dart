

import 'package:get/get.dart';
import 'package:face_net_authentication/whitelhr.dart';
import 'package:face_net_authentication/widget/custom_appbar_widget.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({Key? key}) : super(key: key);

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
            profileWidget(),
            const Spacer(),
            paymentWidget(),
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

  Widget profileWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      userImageWidget(),
                      SizedBox(height: 20.h),
                      AppTextFieldStyles.normal(
                          controller: CustomTextFieldController(),
                          hint: 'Amount'),
                    ],
                  )),
              SizedBox(width: 20.w),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextFieldStyles.normal(
                        controller: CustomTextFieldController(),
                        hint: 'Employee Mobile Number'),
                    SizedBox(height: 20.h),
                    Text(
                      'Name & Designation\nBranch /Posting',
                      style: AppTextStyles.title3
                          .copyWith(color: AppColors.blueGrey, fontSize: 14.sp),
                    ),
                    SizedBox(height: 20.h),
                    AppTextFieldStyles.normal(
                        controller: CustomTextFieldController(),
                        hint: 'Cheque Detail or Cash'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomButtons.fillButton(
              onPressed: () {},
              name: 'Validate Employee',
              radius: 50.r,
              width: 250.w)
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
        child: Image.network(
          Assets.profileImage,
          fit: BoxFit.cover,
          width: 100.h,
          height: 100.h,
        ),
      ),
    );
  }

  Widget paymentWidget() {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Leave States',
                style: AppTextStyles.title1.copyWith(color: AppColors.blueGrey),
              ),
              Divider(
                color: AppColors.blueGrey,
                thickness: 2.h,
              ),
              paymentItemTitlesWidget(),
              Divider(
                color: AppColors.blueGrey,
                thickness: 2.h,
              ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return paymentItemWidget(
                      paymentDetails:
                          'Payment Mastercard, Michael Levy, 2444273406157480, 01/2021, CVV: 027',
                      receiveDetails:
                          'Receive Mastercard, Michael Levy, 2444273406157480, 01/2021, CVV: 027',
                      cancel: '',
                    );
                  }),
            ],
          ),
        ));
  }

  Widget paymentItemTitlesWidget() {
    return Row(
      children: [
        Expanded(
          child: Text('PaymentDetails',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
        Expanded(
          child: Text('ReceiveDetails',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
        Expanded(
          child: Text('Cancel',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
      ],
    );
  }

  Widget paymentItemWidget({
    required String paymentDetails,
    required String receiveDetails,
    required String cancel,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(paymentDetails,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline2
                      .copyWith(color: AppColors.blueGrey)),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(receiveDetails,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline2
                      .copyWith(color: AppColors.blueGrey)),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(cancel,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline2
                      .copyWith(color: AppColors.blueGrey)),
            ),
          ],
        ),
        Divider(
          color: AppColors.blueGrey.withOpacity(0.4),
          thickness: 2.h,
        ),
      ],
    );
  }

  Widget appbarWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 50.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButtons.backButton(title: 'Pay'),
          Image.asset(
            Assets.logoWhite,
            width: 150.w,
          ),
        ],
      ),
    );
  }
}

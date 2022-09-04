

import 'package:get/get.dart';
import 'package:face_net_authentication/whitelhr.dart';
import 'package:face_net_authentication/widget/custom_appbar_widget.dart';


class PayrollScreen extends StatelessWidget {
  const PayrollScreen({Key? key}) : super(key: key);

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
            salaryCertificateWidget(),
            const Spacer(),
            leaveWidget(),
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

  Widget salaryCertificateWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Salary Certificate',
            style: AppTextStyles.title1.copyWith(color: AppColors.blueGrey),
          ),
          SizedBox(height: 16.h),
          CustomButtons.iconWithTitleButton(
              onPressed: () {},
              icon: Icons.download_for_offline_rounded,
              title: 'Download')
        ],
      ),
    );
  }

  Widget leaveWidget() {
    return Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
    borderRadius: BorderRadius.circular(20.r),
    ),      child: Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
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
          leaveItemTitlesWidget(),
          Divider(
            color: AppColors.blueGrey,
            thickness: 2.h,
          ),
          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (_, index) {
                return leaveItemWidget(
                  date: '02-07-2022',
                  month: 'July',
                  amount: '10,000/-',
                  download: Icons.download_for_offline_rounded,
                );
              }),
        ],
      ),
    ));
  }

  Widget leaveItemTitlesWidget() {
    return Row(
      children: [
        Expanded(
          child: Text('Disburse Date',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(
                color: AppColors.blueGrey,
                fontSize: 14.sp,
              )),
        ),
        Expanded(
          child: Text('Salary Month',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(
                color: AppColors.blueGrey,
                fontSize: 14.sp,
              )),
        ),
        Expanded(
          child: Text('Total Amount',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(
                color: AppColors.blueGrey,
                fontSize: 14.sp,
              )),
        ),
        Expanded(
          child: Text('Download',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(
                color: AppColors.blueGrey,
                fontSize: 14.sp,
              )),
        ),
      ],
    );
  }

  Widget leaveItemWidget({
    required String date,
    required String month,
    required String amount,
    required IconData download,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(date,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline2
                      .copyWith(color: AppColors.blueGrey)),
            ),
            Expanded(
              child: Text(month,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline2
                      .copyWith(color: AppColors.blueGrey)),
            ),
            Expanded(
              child: Text(amount,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline2
                      .copyWith(color: AppColors.blueGrey)),
            ),
            Expanded(
              child: Container(
                width: AppSize.width,
                height: 32.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.blue,
                ),
                child: Icon(
                  download,
                  size: 22.h,
                  color: AppColors.white,
                ),
              ),
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

  Widget optionWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButtons.optionButton(
          onPressed: () {},
          icon: Assets.applyLeave,
        ),
        CustomButtons.optionButton(
          onPressed: () {},
          icon: Assets.approveLeave,
        ),
        CustomButtons.optionButton(
          onPressed: () {},
          icon: Assets.relieveLeave,
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
          CustomButtons.backButton(title: 'Payroll'),
          Image.asset(
            Assets.logoWhite,
            width: 150.w,
          ),
        ],
      ),
    );
  }
}
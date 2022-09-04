

import 'package:get/get.dart';
import 'package:face_net_authentication/whitelhr.dart';
import 'package:face_net_authentication/widget/custom_appbar_widget.dart';

class ReceiveScreen extends StatelessWidget {
  const ReceiveScreen({Key? key}) : super(key: key);

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
            pendingReceiveWidget(),
            const Spacer(),
            receiveWidget(),
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

  Widget pendingReceiveWidget() {
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
                'Pending Receive',
                style: AppTextStyles.title1.copyWith(color: AppColors.blueGrey),
              ),
              Divider(
                color: AppColors.blueGrey,
                thickness: 2.h,
              ),
              pendingReceiveItemTitlesWidget(),
              Divider(
                color: AppColors.blueGrey,
                thickness: 2.h,
              ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return pendingReceiveItemWidget(
                      details:
                          'Amount: 30,000/=\nCash/Check:Chg123456789\nPayDate: 10 July 2022\nTime:10:16am',
                      paidBy: 'Babu Ahmed',
                      confirm: Icons.check_circle_outline_outlined,
                    );
                  }),
            ],
          ),
        ));
  }

  Widget receiveWidget() {
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
                'Receive History',
                style: AppTextStyles.title1.copyWith(color: AppColors.blueGrey),
              ),
              Divider(
                color: AppColors.blueGrey,
                thickness: 2.h,
              ),
              receiveItemTitlesWidget(),
              Divider(
                color: AppColors.blueGrey,
                thickness: 2.h,
              ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return receiveItemWidget(
                      details:
                          'Amount: 30,000/=\nCash/Check:Chg123456789\nPayDate: 10 July 2022\nTime:10:16am',
                      paidBy: 'Babu Ahmed',
                    );
                  }),
            ],
          ),
        ));
  }

  Widget pendingReceiveItemTitlesWidget() {
    return Row(
      children: [
        Expanded(
          child: Text('Pay Details',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
        Expanded(
          child: Text('Paid By',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
        Expanded(
          child: Text('Confirm',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
      ],
    );
  }

  Widget receiveItemTitlesWidget() {
    return Row(
      children: [
        Expanded(
          child: Text('Receive Details',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
        Expanded(
          child: Text('Paid By',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
      ],
    );
  }

  Widget pendingReceiveItemWidget({
    required String details,
    required String paidBy,
    required IconData confirm,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(details,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline2
                      .copyWith(color: AppColors.blueGrey)),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(paidBy,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline2
                      .copyWith(color: AppColors.blueGrey)),
            ),
            Expanded(
              child: Icon(
                confirm,
                color: Colors.red,
                size: 22.h,
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

  Widget receiveItemWidget({
    required String details,
    required String paidBy,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(details,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline2
                      .copyWith(color: AppColors.blueGrey)),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(paidBy,
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
          CustomButtons.backButton(title: 'Receive'),
          Image.asset(
            Assets.logoWhite,
            width: 150.w,
          ),
        ],
      ),
    );
  }
}

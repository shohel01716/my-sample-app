

import 'package:get/get.dart';
import 'package:face_net_authentication/whitelhr.dart';
import 'package:face_net_authentication/widget/custom_appbar_widget.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({Key? key}) : super(key: key);

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
            optionWidget(),
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
                      leave: '02-07-2022',
                      from: '02-07-2022',
                      to: '02-07-2022',
                      states: index == 2 ? 'Approved':'Applied');
                }),

          ],
        ),
      ),
    );
  }

  Widget leaveItemTitlesWidget() {
    return Row(
      children: [
        Expanded(
          child: Text('Leave',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
        Expanded(
          child: Text('From',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
        Expanded(
          child: Text('To',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
        Expanded(
          child: Text('States',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
      ],
    );
  }

  Widget leaveItemWidget({
    required String leave,
    required String from,
    required String to,
    required String states,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(leave,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline2
                      .copyWith(color: AppColors.blueGrey)),
            ),
            Expanded(
              child: Text(from,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline2
                      .copyWith(color: AppColors.blueGrey)),
            ),
            Expanded(
              child: Text(to,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline2
                      .copyWith(color: AppColors.blueGrey)),
            ),
            Expanded(
              child: Text(states,
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
          CustomButtons.backButton(title: 'Leave'),
          Image.asset(
            Assets.logoWhite,
            width: 150.w,
          ),
        ],
      ),
    );
  }
}

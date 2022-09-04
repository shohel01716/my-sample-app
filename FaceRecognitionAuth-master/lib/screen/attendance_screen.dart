

import 'package:get/get.dart';
import 'package:face_net_authentication/whitelhr.dart';
import 'package:face_net_authentication/widget/custom_appbar_widget.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

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
            historyWidget(),
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

  Widget historyWidget() {
    return Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'History',
                style: AppTextStyles.title1.copyWith(color: AppColors.blueGrey),
              ),
              Divider(
                color: AppColors.blueGrey,
                thickness: 2.h,
              ),
              historyItemTitlesWidget(),
              Divider(
                color: AppColors.blueGrey,
                thickness: 2.h,
              ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (_, index) {
                    return historyItemWidget(
                        date: '02-07-2022',
                        checkIn: '09:20am',
                        checkOut: '05:10pm');
                  }),
              // Divider(
              //   color: AppColors.blueGrey,
              //   thickness: 2.h,
              // ),
            ],
          ),
        ));
  }

  Widget historyItemTitlesWidget() {
    return Row(
      children: [
        Expanded(
          child: Text('Date',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
        Expanded(
          child: Text('Check In',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
        Expanded(
          child: Text('Check Out',
              textAlign: TextAlign.center,
              style: AppTextStyles.title3.copyWith(color: AppColors.blueGrey)),
        ),
      ],
    );
  }

  Widget historyItemWidget({
    required String date,
    required String checkIn,
    required String checkOut,
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
              child: Text(checkIn,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headline2
                      .copyWith(color: AppColors.blueGrey)),
            ),
            Expanded(
              child: Text(checkOut,
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
          icon: Assets.otherAttendance,
        ),
        CustomButtons.optionButton(
          onPressed: () {},
          icon: Assets.lateRequest,
        ),
        CustomButtons.optionButton(
          onPressed: () {},
          icon: Assets.latePermission,
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
          CustomButtons.backButton(title: 'Attendance'),
          Image.asset(
            Assets.logoWhite,
            width: 150.w,
          ),
        ],
      ),
    );
  }
}

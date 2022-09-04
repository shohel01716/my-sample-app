
import 'package:get/get.dart';
import 'package:face_net_authentication/app/date_time.dart';
import 'package:face_net_authentication/controllers/auth_controller.dart';
import 'package:face_net_authentication/controllers/dashboard_controller.dart';
import 'package:face_net_authentication/services/GetControllers.dart';
import 'package:face_net_authentication/whitelhr.dart';
import 'package:face_net_authentication/widget/floating_widget.dart';

import '../widget/custom_appbar_widget.dart';

class DashboardScreen extends StatefulWidget {

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  AuthController signInController =
  GetControllers.shared.getSignInController();

  DashboardController dashboardController =
  GetControllers.shared.getDashboardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteDeep,
      body: CustomAppBar(
        widgets: appbarWidget(),
        height: 150.h,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        navBarWidget: navbarWidget(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            profileWidget(),
            optionWidget(),
          ],
        ),
      ),
    );
  }

  Widget profileWidget() {
    return Obx(() => Column(
      children: [
        Card(
          elevation: 10,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                userImageWidget(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 14.h,
                            height: 14.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            signInController.responseCheckUser.value.name.toString(),
                            style: AppTextStyles.title2,
                          ),
                        ],
                      ),
                      Text(
                        signInController.responseCheckUser.value.designationShort.toString(),
                        style: AppTextStyles.headline1.copyWith(
                          color: AppColors.blueGrey.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        signInController.responseCheckUser.value.dept.toString(),
                        style: AppTextStyles.headline1.copyWith(
                          color: AppColors.blueGrey.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        signInController.responseCheckUser.value.organizationName.toString(),
                        style: AppTextStyles.title2,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  width: 5.w,
                  height: 80.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.blueGrey,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: FloatingWidget(
            alignment: Alignment.bottomCenter,
            floatingBody: Container(
              width: AppSize.width,
              decoration: BoxDecoration(
                  color: AppColors.blueGrey,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(
                      20.r,
                    ),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 15.h),
                  Text(dashboardController.responseConfirmLogin.value.attDate.toString(),
                      style: AppTextStyles.headline1
                          .copyWith(color: AppColors.white)),
                  SizedBox(height: 5.h),
                  Text(DateTimeUtility.nowDay(),
                      style: AppTextStyles.headline1.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: AppColors.white)),
                  SizedBox(height: 5.h),
                  RichText(
                    text: TextSpan(
                      text: 'Status : ',
                      style: AppTextStyles.headline1
                          .copyWith(color: AppColors.lime),
                      children: [
                        TextSpan(
                          text: dashboardController.responseConfirmLogin.value.todayLoginStatus,
                          style: AppTextStyles.headline1
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 55.h),
                ],
              ),
            ),
            floatingChild: floatingChildWidget(),
          ),
        ),
      ],
    ));
  }

  Widget floatingChildWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.white),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Clock In',
                      style:
                          AppTextStyles.headline1.copyWith(color: Colors.green),
                    ),
                    SizedBox(height: 4.h),
                    Text(dashboardController.responseConfirmLogin.value.login.toString(),
                      style: AppTextStyles.headline2,
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                Icon(
                  dashboardController.responseConfirmLogin.value.login.toString().isEmpty ? Icons.circle: Icons.check_circle_outline,
                  color: dashboardController.responseConfirmLogin.value.login.toString().isEmpty ? Colors.grey : Colors.green,
                  size: 20.h,
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.white),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Clock In',
                      style: AppTextStyles.headline1.copyWith(color: Colors.red),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      dashboardController.responseConfirmLogin.value.logout.toString(),
                      style: AppTextStyles.headline2,
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                Icon(
                  dashboardController.responseConfirmLogin.value.logout.toString().isEmpty ? Icons.circle : Icons.check_circle_outline,
                  color: dashboardController.responseConfirmLogin.value.logout.toString().isEmpty ? Colors.grey : Colors.red,
                  size: 20.h,
                )
              ],
            ),
          ),
        ),
      ],
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
          signInController.responseCheckUser.value.profileImgLink.toString(),
          fit: BoxFit.cover,
          width: 100.h,
          height: 100.h,
        ),
      ),
    );
  }

  Widget optionWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButtons.optionButton(
              onPressed: () {
                Get.toNamed(attendance);
              },
              icon: Assets.attendance,
            ),
            CustomButtons.optionButton(
              onPressed: () {
                Get.toNamed(leave);
              },
              icon: Assets.leave,
            ),
            CustomButtons.optionButton(
              onPressed: () {
                Get.toNamed(customer);
              },
              icon: Assets.customer,
            ),
          ],
        ),
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButtons.optionButton(
              onPressed: () {
                Get.toNamed(payroll);
              },
              icon: Assets.payroll,
            ),
            CustomButtons.optionButton(
              onPressed: () {},
              icon: Assets.report,
            ),
            CustomButtons.optionButton(
              onPressed: () {},
              icon: Assets.announcement,
            ),
          ],
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
          CustomButtons.iconButton(onPressed: () {}, icon: Assets.menu),
          Image.asset(
            Assets.logoWhite,
            width: 150.w,
          ),
          CustomButtons.iconButton(
              onPressed: () {}, icon: Assets.bellNoNotification),
        ],
      ),
    );
  }

  Widget navbarWidget() {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.blueGrey,
            AppColors.blueGreyDeep,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButtons.iconButton(
            onPressed: () {},
            icon: Assets.adminSelect,
            size: 45,
          ),
          CustomButtons.iconButton(
            onPressed: () {

              Get.toNamed(pay);

            },
            icon: Assets.pay,
            size: 45,
          ),
          CustomButtons.iconButton(
            onPressed: () {
              Get.toNamed(receive);
            },
            icon: Assets.receive,
            size: 45,
          ),
          CustomButtons.iconButton(
            onPressed: () {
              signInController.onTapLogout();
            },
            icon: Assets.logout,
            size: 45,
          ),
        ],
      ),
    );
  }
}

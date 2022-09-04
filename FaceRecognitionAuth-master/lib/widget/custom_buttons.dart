/*                                     *\
          **File Created By**
      name:- Shuoib Hossain 
      time:- Apr 10, 2022 9:47 PM
      contract:-shuibe873@gmail.com
\*                                     */
import 'package:get/get.dart';
import 'package:face_net_authentication/whitelhr.dart';

class CustomButtons {
  CustomButtons._();

  static Widget fillButton({
    required Function onPressed,
    required String name,
    Color? color,
    Color? textColor,
    double height = 50,
    double radius = 15,
    double? width,
    EdgeInsetsGeometry? padding,
  }) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: AppButtonStyles.flat,
          child: Container(
            width: width ?? AppSize.width,
            height: height.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: color ?? AppColors.blue,
            ),
            child: Text(
              name,
              style: AppTextStyles.headline1
                  .copyWith(color: textColor ?? AppColors.white),
            ),
          )),
    );
  }

  static Widget stokeButton({
    required Function onPressed,
    required String name,
    Color? color,
    Color? textColor,
    double height = 50,
    double radius = 8,
    double? width,
    EdgeInsetsGeometry? padding,
  }) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: AppButtonStyles.flat,
          child: Container(
            width: width ?? AppSize.width,
            height: height.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(
                width: 2.h,
                color: color ?? AppColors.blue.withOpacity(0.4),
              ),
            ),
            child: Text(
              name,
              style: AppTextStyles.headline1.copyWith(
                color: textColor ?? AppColors.blue.withOpacity(0.8),
              ),
            ),
          )),
    );
  }

  static Widget backButton({String? title}) {
    return ElevatedButton(
      onPressed: () {
        Get.back();
      },
      style: AppButtonStyles.flat,
      child: title == null
          ? Image.asset(
              Assets.backButton,
              width: 28.h,
              height: 28.h,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.backButton,
                  width: 28.h,
                  height: 28.h,
                ),
                SizedBox(width: 20.w),
                Text(
                  title,
                  style: AppTextStyles.title2.copyWith(color: AppColors.white),
                )
              ],
            ),
    );
  }

  static Widget iconButton({
    required Function onPressed,
    required String icon,
    double? size,
    EdgeInsetsGeometry? padding,
  }) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: AppButtonStyles.flat,
        child: Image.asset(
          icon,
          width: (size ?? 28).h,
          height: (size ?? 28).h,
        ),
      ),
    );
  }

  static Widget iconWithTitleButton({
    required Function onPressed,
    Color? color,
    Color? textColor,
    double height = 50,
    double? width,
    EdgeInsetsGeometry? padding,
    required IconData icon,
    required String title,
    double? size,
  }) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: AppButtonStyles.flat,
          child: Container(
            width: width ?? AppSize.width,
            height: height.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: color ?? AppColors.blue,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: (size ?? 28).h,
                ),
                SizedBox(width: 10.w),
                Text(
                  title,
                  style: AppTextStyles.headline1
                      .copyWith(color: textColor ?? AppColors.white),
                ),
              ],
            ),
          )),
    );
  }

  static Widget optionButton({
    required Function onPressed,
    required String icon,
  }) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: AppButtonStyles.flat,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Image.asset(
            icon,
          ),
        ),
      ),
    );
  }
}

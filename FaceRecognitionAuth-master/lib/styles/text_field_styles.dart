/*                                     *\
          **File Created By**
      name:- Shuoib Hossain 
      time:- Aug 12, 2022 2:24 AM
      contract:-shuibe873@gmail.com
\*                                     */

import 'package:face_net_authentication/whitelhr.dart';

class AppTextFieldStyles {
  AppTextFieldStyles._();

  static Widget normal(
      {required CustomTextFieldController controller,
      required String hint,
      TextInputType keyboardType = TextInputType.text}) {
    return CustomTextField(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
      controller: controller,
      borderRadiusAll: 8.r,
      backgroundColor: AppColors.blueGrey.withOpacity(0.1),
      hintText: hint,
      keyboardType: keyboardType,
      hintStyle: AppTextStyles.headline2.copyWith(
        color: AppColors.blueGrey.withOpacity(0.6),
      ),
      cursorColor: AppColors.blueGreyDeep,
      textStyle: AppTextStyles.headline2,
      showErrorBorder: false,
      maxLines: 1,
      /*decoration: InputDecoration(
      labelText: "",
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(
          color: Colors.blue,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        // borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 2.0,
        ),
      ),
    ),*/
    );
  }
  static Widget pin(
      {required CustomTextFieldController controller,
      required String hint,
      int? maxLength}) {
    return CustomTextField(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
      controller: controller,
      borderRadiusAll: 8.r,
      backgroundColor: AppColors.blueGrey.withOpacity(0.1),
      hintText: hint,
      keyboardType: TextInputType.number,
      hintStyle: AppTextStyles.headline2.copyWith(
        color: AppColors.blueGrey.withOpacity(0.6),
        wordSpacing: 10,
      ),
      cursorColor: AppColors.blueGreyDeep,
      textStyle: AppTextStyles.headline2.copyWith(wordSpacing: 10),
      showErrorBorder: false,
      maxLines: 1,
      maxLength: maxLength,
      fieldType: FieldType.pin,
      textAlign: TextAlign.center,
    );
  }
}

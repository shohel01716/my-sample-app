   
/*                                     *\
          **File Created By**
      name:- Shuoib Hossain 
      time:- Aug 12, 2022 2:24 AM
      contract:-shuibe873@gmail.com
\*                                     */
 
 
import 'package:face_net_authentication/whitelhr.dart';


class AppTextStyles {
   AppTextStyles._();

   ///Font Size 24. Font Weight Bold.
   static TextStyle get title1 {
      return TextStyle(
          fontSize: 24.sp,
          // fontFamily: AppFonts.poppinsBold,
          color: AppColors.black,
          fontWeight: FontWeight.bold);
   }

   ///Font Size 18. Font Weight Bold.
   static TextStyle get title2 => title1.copyWith(fontSize: 18.sp);

   ///Font Size 16. Font Weight Bold.
   static TextStyle get title3 => title1.copyWith(fontSize: 16.sp);

   ///Font Size 18. Font Weight Medium.
   static TextStyle get headline1 {
      return TextStyle(
         fontSize: 20.sp,
         // fontFamily: AppFonts.poppinsMedium,
         color: AppColors.black,
      );
   }

   ///Font Size 16. Font Weight Medium.
   static TextStyle get headline2 => headline1.copyWith(fontSize: 16.sp);

   ///Font Size 14. Font Weight Medium.
   static TextStyle get headline3 => headline1.copyWith(fontSize: 14.sp);

   ///Font Size 16. Font Weight Regular.
   static TextStyle get paragraph1 {
      return TextStyle(
          fontSize: 16.sp,
          // fontFamily: AppFonts.poppinsRegular,
          color: AppColors.black,
          fontWeight: FontWeight.normal);
   }

   ///Font Size 14. Font Weight Regular.
   static TextStyle get paragraph2 => paragraph1.copyWith(fontSize: 14.sp);

   ///Font Size 12. Font Weight Regular.
   static TextStyle get paragraph3 => paragraph1.copyWith(fontSize: 12.sp);


   ///Font Size 16. Font Weight Regular.
   static TextStyle get title {
      return TextStyle(
          fontSize: 16.sp,
          // fontFamily: AppFonts.poppinsRegular,
          color: AppColors.black.withOpacity(.7),
          fontWeight: FontWeight.normal);
   }

   ///Font Size 14. Font Weight Regular.
   static TextStyle get customTitle => title.copyWith(fontSize: 22.sp);
}

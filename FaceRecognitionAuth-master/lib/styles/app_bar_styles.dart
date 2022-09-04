/*                                     *\
          **File Created By**
      name:- Shuoib Hossain 
      time:- Aug 12, 2022 2:24 AM
      contract:-shuibe873@gmail.com
\*                                     */

import 'package:face_net_authentication/whitelhr.dart';

class AppAppBarStyles {
  AppAppBarStyles._();

  static AppBar get normal => AppBar(
        toolbarHeight: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteDeep,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.whiteDeep,
          systemNavigationBarColor: AppColors.whiteDeep,
          systemNavigationBarDividerColor: AppColors.whiteDeep,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      );

  static AppBar get white => AppBar(
        toolbarHeight: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          systemNavigationBarColor: AppColors.white,
          systemNavigationBarDividerColor: AppColors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      );

  static AppBar get transparent => AppBar(
        toolbarHeight: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lime.withOpacity(0.0),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      );
  static AppBar get transparent2 => AppBar(
        toolbarHeight: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      );

  static AppBar get splash => AppBar(
        toolbarHeight: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.custom('F3F4F9'),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.custom('F3F4F9'),
          systemNavigationBarColor: AppColors.custom('F3F4F9'),
          systemNavigationBarDividerColor: AppColors.custom('F3F4F9'),
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      );
}

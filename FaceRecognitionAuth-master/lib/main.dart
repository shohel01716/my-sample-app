import 'package:face_net_authentication/app/app_keys.dart';
import 'package:face_net_authentication/app/app_labels.dart';
import 'package:face_net_authentication/language/localization_service.dart';
import 'package:face_net_authentication/locator.dart';
import 'package:face_net_authentication/pages/home.dart';
import 'package:face_net_authentication/router/nav_router.dart';
import 'package:face_net_authentication/router/route_constants.dart';
import 'package:face_net_authentication/strings/hive_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

Future<void> main() async {
  setupServices();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter(); //Hive is used for storing of strings like user name and user ids etc.
  await Hive.openBox(HiveString.hiveName);

  runApp(const WhitelHr());
}

class WhitelHr extends StatelessWidget {
  const WhitelHr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          builder: (context, widget) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, widget!),
              maxWidth: 2460,
              minWidth: 450,
              defaultScale: true,
              breakpoints: const [
                ResponsiveBreakpoint.resize(450, name: MOBILE),
                ResponsiveBreakpoint.autoScale(800, name: TABLET),
                ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
              background: Container(color: const Color(0xFFF5F5F5))),
          debugShowCheckedModeBanner: false,
          initialRoute: splash,
          locale: LocalizationService.locale,
          fallbackLocale: LocalizationService.fallbackLocale,
          translations: LocalizationService(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: LocalizationService.locales,
          defaultTransition: Transition.native,
          getPages: NavRouter.generateRoute,
          title: AppLabels.appName,
          navigatorKey: AppKeys.navigatorKey,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        );
      },
    );
  }
}

import 'package:get/route_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:face_net_authentication/strings/hive_string.dart';
import 'package:face_net_authentication/whitelhr.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var box = Hive.box(HiveString.hiveName);

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (isGetStartShowAlready()) {
        Get.offNamed(signIn);
      } else {
        Get.offNamed(getStart);
      }
    });
  }

  bool isShowAlready = false;

  bool isGetStartShowAlready() {
    var isShow = box.get(HiveString.first);
    debugPrint('==========isShow=========: $isShow');

    if (isShow != null && true) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.splash,
      body: Stack(
        children: [
          Image.asset(
            Assets.background,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Container(
              alignment: Alignment.center,
              child: Image.asset(
                Assets.startLogoGif,
                height: 220.0.h,
                width: 220.0.w,
              )),
        ],
      ),
    );
  }
}

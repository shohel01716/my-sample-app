import 'package:get/route_manager.dart';
import 'package:face_net_authentication/router/route_constants.dart';
import 'package:face_net_authentication/screen/authentication/enter_pin_screen.dart';
import 'package:face_net_authentication/screen/authentication/sign_in_screen.dart';
import 'package:face_net_authentication/screen/customer_visit_screen.dart';
import 'package:face_net_authentication/screen/dashboard_screen.dart';
import 'package:face_net_authentication/screen/get_start_screen.dart';
import 'package:face_net_authentication/screen/pay_screen.dart';
import 'package:face_net_authentication/screen/payroll_screen.dart';
import 'package:face_net_authentication/screen/splash_screen.dart';

import '../screen/leave_screen.dart';
import '../screen/attendance_screen.dart';
import '../screen/receive_screen.dart';

class NavRouter {
  static final generateRoute = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: getStart,
      page: () => GetStartScreen(),
    ),
    GetPage(
      name: signIn,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: enterPin,
      page: () => const EnterPinScreen(),
    ),
    GetPage(
      name: dashboard,
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: attendance,
      page: () => const AttendanceScreen(),
    ),
    GetPage(
      name: leave,
      page: () => const LeaveScreen(),
    ),
    GetPage(
      name: customer,
      page: () => const CustomerVisitScreen(),
    ),
    GetPage(
      name: payroll,
      page: () => const PayrollScreen(),
    ),
    GetPage(
      name: pay,
      page: () => const PayScreen(),
    ),
    GetPage(
      name: receive,
      page: () => const ReceiveScreen(),
    ),
  ];
}

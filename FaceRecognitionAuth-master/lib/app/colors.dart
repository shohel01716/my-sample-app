import 'package:face_net_authentication/whitelhr.dart';

class AppColors {
  AppColors._();
  static Color get white => const Color(0xFFFFFFFF);
  static Color get whiteDeep => const Color(0xFFFAFAFA);
  static Color get black => const Color(0xFF040415);
  static Color get blueGrey => const Color(0xFF3D5473);
  static Color get blueGreyDeep => const Color(0xFF1B3149);
  static Color get blue => const Color(0xFF0065A9);
  static Color get lime => const Color(0xFFE1E68F);

  static Color custom(String code) {
    final colorCode = code.replaceAll('#', '');
    return Color(int.parse('0xFF$colorCode'));
  }

  static Color get random {
    return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  }



  static const Color transparent = Color(0x00000000);
  static const Color background = Color(0xFF000000);
  static const Color backgroundWhite = Color(0xFFFBFBFE);
  static const textColorPrimary = Color(0xFF2d2d2d);
  static const Color themeColor = Colors.yellow;
  static const Color overLay = Colors.orange;
  static const Color textColorSec = Color(0xff424242);
  static const Color buttonColor = Color(0xff1fdbb5);
  static const Color cardColor = Color(0xfff6f6f6);
  static const Color black50 = Colors.black54;
  static const Color appBarColor = Color(0xFFFBFBFE);

/*  static const MaterialColor cyan = MaterialColor(
    0xFF278FA4,
    <int, Color>{
      50: Color(0xFFE0F7FA),
      100: Color(0xFFB2EBF2),
      200: Color(0xFF80DEEA),
      300: Color(0xFF4DD0E1),
      400: Color(0xFF26C6DA),
      500: Color(0xFF278FA4),
      600: Color(0xFF00ACC1),
      700: Color(0xFF0097A7),
      800: Color(0xFF00838F),
      900: Color(0xFF006064),
    },
  );*/
}

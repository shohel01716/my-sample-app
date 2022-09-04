/*                                     *\
          **File Created By**
      name:- Shuoib Hossain 
      time:- Jul 31, 2022 1:28 AM
      contract:-shuibe873@gmail.com
\*                                     */

import 'package:face_net_authentication/whitelhr.dart';

final BuildContext _buildContext =
    AppKeys.navigatorKey.currentContext as BuildContext;

class AppSize {
  AppSize._();

  static get width => _width();

  static get height => _height();

  static heightPercentage(int percentage) => _heightPercentage(percentage);
}

_width() {
  final double _w = MediaQuery.of(_buildContext).size.width;
  return _w;
}

_height() {
  final double _h = MediaQuery.of(_buildContext).size.height;
  return _h;
}

_heightPercentage(percentage) {
  final double _h = MediaQuery.of(_buildContext).size.height / 100;
  return _h * percentage;
}

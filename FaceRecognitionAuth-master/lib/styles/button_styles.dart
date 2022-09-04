   
/*                                     *\
          **File Created By**
      name:- Shuoib Hossain 
      time:- Aug 12, 2022 2:24 AM
      contract:-shuibe873@gmail.com
\*                                     */
 
import 'package:face_net_authentication/whitelhr.dart';


class AppButtonStyles {
   AppButtonStyles._();
   static ButtonStyle get flat => ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size.zero),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      elevation: MaterialStateProperty.all(0.0),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      alignment: Alignment.center,
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
   );
}


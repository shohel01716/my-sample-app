/*                                     *\
          **File Created By**
      name:- Shuoib Hossain 
      time:- Aug 13, 2022 7:14 PM
      contract:-shuibe873@gmail.com
\*                                     */
import 'package:face_net_authentication/whitelhr.dart';

class CustomAppBar extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Widget widgets;
  final Widget? navBarWidget;
  final double? height;

  const CustomAppBar({
    Key? key,
    required this.widgets,
    required this.child,
    this.padding,
    this.height,
    this.navBarWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30.r),
              ),
              gradient: LinearGradient(
                colors: [
                  AppColors.blueGrey,
                  AppColors.blueGreyDeep,
                ],
              )),
          height: height ?? 180.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: widgets,
        ),
        Expanded(
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
        navBarWidget ?? Container(),
      ],
    );
  }
}

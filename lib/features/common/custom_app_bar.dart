import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snowboard/features/common/skibo_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(100.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: SkiboColor.transparentColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      leading: Padding(
        padding: EdgeInsets.only(left: 24.w),
        child: GestureDetector(
          onTap: () => context.router.pop(),
          child: SvgPicture.asset(
            'assets/svg/arrow_left.svg',
            width: 30.h,
            height: 30.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

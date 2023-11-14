import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snowboard/features/common/custom_button.dart';
import 'package:snowboard/features/common/equipment_list.dart';
import 'package:snowboard/features/common/skibo_color.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.h, left: 14.w, right: 14.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70.h),
              const _ProfileCard(),
              SizedBox(height: 30.h),
              Text(
                'Мои истории',
                style: GoogleFonts.inter(
                  color: SkiboColor.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 18.h),
              const EquipmentList(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 67.h, bottom: 25.h, right: 25.w, left: 25.w),
          width: double.infinity,
          decoration: BoxDecoration(
            color: SkiboColor.blue2Color,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            children: [
              Text(
                'Иванов Иван Иванович',
                style: GoogleFonts.inter(
                  color: SkiboColor.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/geolocation.svg',
                            width: 25.h,
                            height: 25.h,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Мы тут',
                            style: GoogleFonts.inter(
                              color: SkiboColor.blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      text: 'Изменить',
                      showBlackColor: false,
                      isTextCentered: true,
                      borderRadius: 15,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomButton(
                text: 'Связаться с нами',
                height: 60.h,
                borderRadius: 15,
                leftIcon: 'assets/svg/mail.svg',
                leftIconColor: SkiboColor.whiteColor,
                leftIconTextSpacing: 14,
                rightIcon: 'assets/svg/circle_arrow_right.svg',
                rigthPadding: 38,
                onTap: () {},
              ),
              SizedBox(height: 12.h),
              CustomButton(
                text: 'Мои документы',
                height: 60.h,
                borderRadius: 15,
                leftIcon: 'assets/svg/pdf.svg',
                leftIconTextSpacing: 14,
                rightIcon: 'assets/svg/circle_arrow_right.svg',
                rigthPadding: 38,
                onTap: () {},
              ),
            ],
          ),
        ),
        Positioned(
          top: -50.h,
          child: ClipOval(
            child: Image.asset(
              'assets/png/avatar.png',
              height: 100.h,
              width: 100.h,
            ),
          ),
        ),
        Positioned(
          top: -70.h,
          right: 14.w,
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/svg/burger.svg',
              height: 32.h,
              width: 32.h,
            ),
          ),
        ),
      ],
    );
  }
}

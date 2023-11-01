import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snowboard/core/auto_route/app_router.dart';
import 'package:snowboard/features/common/custom_button.dart';
import 'package:snowboard/features/common/row_text_in_auth.dart';
import 'package:snowboard/features/common/skibo_color.dart';

@RoutePage()
class PhoneNumberRegistrationScreen extends StatefulWidget {
  const PhoneNumberRegistrationScreen({super.key});

  @override
  State<PhoneNumberRegistrationScreen> createState() =>
      _PhoneNumberRegistrationScreenState();
}

class _PhoneNumberRegistrationScreenState
    extends State<PhoneNumberRegistrationScreen> {
  String? _selectedCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const AppBarBack(),
      body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 90.h),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login with\nPhoneNumber',
                style: GoogleFonts.inter(
                  color: SkiboColor.blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(height: 28.h),
              Text(
                'Номер телефона',
                style: GoogleFonts.inter(
                  color: SkiboColor.defaultColorButton,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 18.h),
              Row(
                children: [
                  Container(
                    height: 59.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: SkiboColor.focusedBorderColor, width: 1.w),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: DropdownButton(
                      iconSize: 10.h,
                      padding: EdgeInsets.only(
                        top: 20.h,
                        bottom: 20.h,
                        left: 27.w,
                      ),
                      icon: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: SvgPicture.asset(
                          'assets/svg/drop_down_arrow.svg',
                          height: 10.h,
                          width: 10.h,
                        ),
                      ),
                      underline: const SizedBox.shrink(),
                      value: _selectedCode,
                      style: GoogleFonts.inter(
                        color: SkiboColor.blackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                      items: ['+77', '+88', '+99']
                          .map(
                            (code) => DropdownMenuItem(
                              value: code,
                              child: Text(
                                code,
                                style: GoogleFonts.inter(
                                  color: SkiboColor.blackColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) =>
                          setState(() => _selectedCode = value),
                    ),
                  ),
                  SizedBox(width: 18.w),
                  Expanded(
                    child: Container(
                      height: 59.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: SkiboColor.focusedBorderColor, width: 1.w),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: GoogleFonts.inter(
                          color: SkiboColor.blackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                            top: 20.h,
                            bottom: 20.h,
                            left: 24.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: CustomButton(
                  onTap: () => context.router.push(const VerificationRoute()),
                  text: 'Подтвердить',
                  isTextCentered: true,
                ),
              ),
              const Spacer(),
              RowTextInAuth(
                mainAxisAlignment: MainAxisAlignment.center,
                text: 'У вас еще нет учетной записи?',
                textSecond: 'Зарегистрироваться',
                onTap: () => context.router.push(const RegistrationRoute()),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBack({super.key});

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

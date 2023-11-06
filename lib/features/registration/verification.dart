import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:snowboard/core/auto_route/app_router.dart';
import 'package:snowboard/features/common/custom_button.dart';
import 'package:snowboard/features/common/row_text_in_auth.dart';
import 'package:snowboard/features/common/skibo_color.dart';
import 'package:snowboard/features/registration/phone_number_registration.dart';

@RoutePage()
class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const AppBarBack(),
      body: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 90.h),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Text(
                  'Login with\nPhoneNumber',
                  style: GoogleFonts.inter(
                    color: SkiboColor.blackColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                  ),
                ),
              ),
              SizedBox(height: 60.h),
              Pinput(
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                length: 6,
                showCursor: true,
                defaultPinTheme: PinTheme(
                  width: 55.w,
                  height: 84.h,
                  textStyle: GoogleFonts.ibmPlexSans(
                    color: SkiboColor.black2Color,
                    fontWeight: FontWeight.w300,
                    fontSize: 52.sp,
                  ),
                  decoration: BoxDecoration(
                    color: SkiboColor.whiteColor,
                    border: Border.all(color: SkiboColor.gray3Color),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
              SizedBox(height: 45.h),
              Center(
                child: Text(
                  'Отправить повторный код через 50 сек',
                  style: GoogleFonts.montserrat(
                    color: SkiboColor.defaultColorButton,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: CustomButton(
                  onTap: () =>
                      context.router.push(IndexSkiboRoute(screenIndex: 0)),
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

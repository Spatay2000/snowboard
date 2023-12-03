import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:snowboard/core/auto_route/app_router.dart';
import 'package:snowboard/core/get_it/configurator.dart';
import 'package:snowboard/features/common/custom_app_bar.dart';
import 'package:snowboard/features/common/custom_button.dart';
import 'package:snowboard/features/common/row_text_in_auth.dart';
import 'package:snowboard/features/common/skibo_color.dart';
import 'package:snowboard/features/registration/verification_bloc/bloc/verification_bloc.dart';

@RoutePage()
class VerificationScreen extends StatefulWidget {
  final String userId;
  const VerificationScreen({
    super.key,
    required this.userId,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final verificationCode = getIt<VerificationBloc>();
  TextEditingController verificationCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(),
      body: BlocProvider(
        create: (context) => verificationCode,
        child: BlocConsumer<VerificationBloc, VerificationState>(
            listener: (context, state) {
          if (state is VerificationFailure) {
            state.message;
          } else if (state is VerificationSuccess) {
            context.router.push(const LoginRoute());
          }
        }, builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 90.h),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Text(
                      'Войти с помощью\nНомера Телефона',
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
                    controller: verificationCodeController,
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
                  SizedBox(height: 95.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w),
                    child: CustomButton(
                      onTap: () {
                        verificationCode.add(VerificationCode(
                          userId: widget.userId,
                          code: int.parse(verificationCodeController.text),
                        ));
                      },
                      text: 'Подтвердить',
                      isTextCentered: true,
                    ),
                  ),
                  SizedBox(height: 235.h),
                  RowTextInAuth(
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'У вас еще нет учетной записи?',
                    textSecond: 'Зарегистрироваться',
                    onTap: () => context.router.push(const RegistrationRoute()),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

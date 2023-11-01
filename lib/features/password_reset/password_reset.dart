import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snowboard/core/auto_route/app_router.dart';
import 'package:snowboard/features/common/custom_button.dart';
import 'package:snowboard/features/common/custom_textfield.dart';
import 'package:snowboard/features/common/row_text_in_auth.dart';
import 'package:snowboard/features/common/skibo_color.dart';
import 'package:snowboard/features/registration/phone_number_registration.dart';

@RoutePage()
class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const AppBarBack(),
      body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 97.h),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Сброс пароля',
                style: GoogleFonts.inter(
                  color: SkiboColor.blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 21.h),
              Text(
                'Введите ваш E-mail, мы вышлем вам ваш пароль на почту, указанную при регистрации.',
                style: GoogleFonts.inter(
                  color: SkiboColor.grayColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 38.h),
              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                type: SkiboInputType.email,
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: SvgPicture.asset(
                    'assets/svg/mail.svg',
                    width: 20.h,
                    height: 14.h,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: CustomButton(
                  onTap: () {},
                  text: 'Отправить',
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

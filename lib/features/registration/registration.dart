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

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.only(top: 52.h, left: 24.w, right: 24.w),
        child: SingleChildScrollView(
          physics: isKeyboardOpen
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Добро пожаловать\n',
                        style: GoogleFonts.montserrat(
                          color: SkiboColor.blackColor,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'Snowboard',
                        style: GoogleFonts.inter(
                          color: SkiboColor.blueColor,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28.h),
                Text(
                  'Зарегистрируйтесь',
                  style: GoogleFonts.inter(
                    color: SkiboColor.grayColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 28.h),
                _CustomTextFieldWithLabel(
                  controller: fullnameController,
                  hintText: 'ФИО',
                ),
                SizedBox(height: 12.h),
                _CustomTextFieldWithLabel(
                  controller: emailController,
                  hintText: 'Email',
                  type: SkiboInputType.email,
                ),
                SizedBox(height: 12.h),
                _CustomTextFieldWithLabel(
                  controller: passwordController,
                  hintText: 'Пароль',
                  obscureText: true,
                ),
                SizedBox(height: 12.h),
                _CustomTextFieldWithLabel(
                  controller: repeatPasswordController,
                  hintText: 'Повторите пароль',
                  obscureText: true,
                ),
                SizedBox(height: 31.h),
                GestureDetector(
                  onTap: () {
                    isTapped = !isTapped;
                    setState(() {});
                  },
                  child: _TermOfServiceField(isTapped: isTapped),
                ),
                SizedBox(height: 31.h),
                CustomButton(
                  onTap: () =>
                      context.router.push(const PhoneNumberRegistrationRoute()),
                  text: 'Регистрация',
                  isTextCentered: true,
                ),
                SizedBox(height: 37.h),
                RowTextInAuth(
                  mainAxisAlignment: MainAxisAlignment.center,
                  text: 'Уже есть учетная запись?',
                  textSecond: 'Вход',
                  onTap: () => context.router.push(const LoginRoute()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TermOfServiceField extends StatelessWidget {
  final bool isTapped;

  const _TermOfServiceField({required this.isTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        children: [
          SvgPicture.asset(
            isTapped
                ? 'assets/svg/checkbox.svg'
                : 'assets/svg/checkbox_blank.svg',
            height: 25.h,
            width: 25.h,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              'Выполняя вход, вы соглашаетесь с нашими Условиями использования и Политикой конфиденциальности.',
              style: GoogleFonts.inter(
                color: SkiboColor.gray2Color,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomTextFieldWithLabel extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final SkiboInputType? type;

  const _CustomTextFieldWithLabel({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: GoogleFonts.inter(
            color: SkiboColor.defaultColorButton,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 14.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: CustomTextField(
            controller: controller,
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            obscureText: obscureText,
            type: type,
          ),
        ),
      ],
    );
  }
}

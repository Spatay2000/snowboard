import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snowboard/core/auto_route/app_router.dart';
import 'package:snowboard/core/get_it/configurator.dart';
import 'package:snowboard/features/common/custom_button.dart';
import 'package:snowboard/features/common/custom_snacbar.dart';
import 'package:snowboard/features/common/custom_textfield.dart';
import 'package:snowboard/features/common/row_text_in_auth.dart';
import 'package:snowboard/features/common/skibo_color.dart';
import 'package:snowboard/features/login/bloc/login_bloc.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final loginBloc = getIt<LoginBloc>();
  List<bool> isSelected = [true, false];

  toggle(int index) {
    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
      if (buttonIndex == index) {
        isSelected[buttonIndex] = true;
      } else {
        isSelected[buttonIndex] = false;
      }
    }
    setState(() {});
  }

  String unmaskPhoneNumber(String maskedPhoneNumber) {
    return maskedPhoneNumber.replaceAll(RegExp(r'[^\d]'), '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => loginBloc,
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              log(state.message);
            } else if (state is LoginSuccess) {
              if (state.success == true) {
                context.router.push(IndexSkiboRoute(screenIndex: 0));
              } else {
                TopOverlayCustomSnackBar.show(context, state.message);
              }
            }
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 14).r,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/png/bg_login_2.png"),
                  fit: BoxFit.contain,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 24, right: 25, top: 26).r,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Логин',
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 15.r),
                          ToggleButtons(
                            selectedColor: Colors.black,
                            focusColor: Colors.transparent,
                            fillColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            renderBorder: false,
                            isSelected: isSelected,
                            onPressed: toggle,
                            children: [
                              uiToggle(isSelected, 'Номер телефона', 0),
                              uiToggle(isSelected, 'E-mail', 1),
                            ],
                          ),
                          SizedBox(
                            height: 10.r,
                          ),
                          if (isSelected[0]) ...[
                            CustomTextField(
                                controller: phoneController,
                                type: SkiboInputType.number,
                                hintText: 'Номер телефона'),
                          ] else ...[
                            CustomTextField(
                                controller: emailController, hintText: 'Email'),
                          ],
                          SizedBox(height: 15.r),
                          CustomTextField(
                              controller: passwordController,
                              hintText: 'Пароль'),
                          SizedBox(height: 28.r),
                          GestureDetector(
                            onTap: () =>
                                context.router.push(const PasswordResetRoute()),
                            child: Text(
                              'Забыли пароль учетной системы?',
                              style: GoogleFonts.inter(
                                color: const Color(0xff7EADF9),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 25.r),
                          CustomButton(
                            onTap: () {
                              loginBloc.add(SignIn(
                                  login: unmaskPhoneNumber(
                                      "7${phoneController.text}"),
                                  passowrd: passwordController.text));
                            },
                            text: 'Вход',
                            showBlackColor: false,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 15).r,
                    child: RowTextInAuth(
                      text: 'У вас еще нет учетной записи?',
                      textSecond: 'Зарегистрироваться',
                      onTap: () =>
                          context.router.push(const RegistrationRoute()),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget uiToggle(List<bool> isSelected, String title, int color) => Column(
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: Colors.black),
        ),
        SizedBox(
          height: 7.r,
        ),
        Container(
          width: 102.r,
          height: 3,
          decoration: BoxDecoration(
              color: isSelected[color]
                  ? SkiboColor.secondaryColorButton
                  : Colors.transparent),
        )
      ],
    );

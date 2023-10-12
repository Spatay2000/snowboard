import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snowboard/features/common/custom_button.dart';
import 'package:snowboard/features/common/row_text_in_auth.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/png/bg_login.png"),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 35, right: 36, top: 48).r,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.r),
                  color: Colors.white),
              child: Column(
                children: [
                  const CustomButton(
                    text: 'Войти',
                    showIcon: true,
                  ),
                  SizedBox(
                    height: 47.h,
                  ),
                  const RowTextInAuth(
                      text: 'У вас еще нет учетной записи?',
                      textSecond: 'Зарегистрироваться')
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

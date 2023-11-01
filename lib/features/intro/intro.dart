import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snowboard/core/auto_route/app_router.dart';
import 'package:snowboard/features/common/custom_button.dart';
import 'package:snowboard/features/common/row_text_in_auth.dart';

@RoutePage()
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
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
                padding: const EdgeInsets.only(left: 30, right: 30, top: 48).r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.r),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Войти',
                      showIcon: true,
                      onTap: () => context.router.push(const LoginRoute()),
                    ),
                    SizedBox(height: 47.h),
                    RowTextInAuth(
                      text: 'У вас еще нет учетной записи?',
                      textSecond: 'Зарегистрироваться',
                      onTap: () =>
                          context.router.push(const RegistrationRoute()),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

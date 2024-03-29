import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snowboard/features/home/home.dart';
import 'package:snowboard/features/index_skibo/index_skibo.dart';
import 'package:snowboard/features/intro/intro.dart';
import 'package:snowboard/features/login/login.dart';
import 'package:snowboard/features/password_reset/password_reset.dart';
import 'package:snowboard/features/profile/profile.dart';
import 'package:snowboard/features/registration/phone_number_bloc/phone_number_registration.dart';
import 'package:snowboard/features/registration/registration_bloc/registration.dart';
import 'package:snowboard/features/registration/verification_bloc/verification.dart';
import 'package:snowboard/features/schedule/schedule.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|TabBar,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: IntroRoute.page,
        ),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(
          page: IndexSkiboRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: LoginRoute.page),
            AutoRoute(page: ScheduleRoute.page),
            AutoRoute(page: ProfileRoute.page),
            
          ],
        ),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(page: PhoneNumberRegistrationRoute.page),
        AutoRoute(page: VerificationRoute.page),
        AutoRoute(page: PasswordResetRoute.page),
      ];
}

class _CheckSession extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool('logged') ?? false;
    if (loggedIn) {
      resolver.next(true);
    } else {
      resolver.redirect(const IntroRoute());
      // Если пользователь не вошел, показываем экран входа.
    }
  }
}

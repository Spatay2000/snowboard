import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snowboard/features/login/login.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen|TabBar,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: LoginRoute.page,
        ),
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
      resolver.redirect(const LoginRoute());
      // Если пользователь не вошел, показываем экран входа.
    }
  }
}

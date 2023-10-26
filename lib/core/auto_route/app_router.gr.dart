// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    IndexSkiboRoute.name: (routeData) {
      final args = routeData.argsAs<IndexSkiboRouteArgs>(
          orElse: () => const IndexSkiboRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: IndexSkiboTabBar(
          key: args.key,
          screenIndex: args.screenIndex,
        ),
      );
    },
    IntroRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IntroScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
  };
}

/// generated route for
/// [IndexSkiboTabBar]
class IndexSkiboRoute extends PageRouteInfo<IndexSkiboRouteArgs> {
  IndexSkiboRoute({
    Key? key,
    int? screenIndex = 0,
    List<PageRouteInfo>? children,
  }) : super(
          IndexSkiboRoute.name,
          args: IndexSkiboRouteArgs(
            key: key,
            screenIndex: screenIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'IndexSkiboRoute';

  static const PageInfo<IndexSkiboRouteArgs> page =
      PageInfo<IndexSkiboRouteArgs>(name);
}

class IndexSkiboRouteArgs {
  const IndexSkiboRouteArgs({
    this.key,
    this.screenIndex = 0,
  });

  final Key? key;

  final int? screenIndex;

  @override
  String toString() {
    return 'IndexSkiboRouteArgs{key: $key, screenIndex: $screenIndex}';
  }
}

/// generated route for
/// [IntroScreen]
class IntroRoute extends PageRouteInfo<void> {
  const IntroRoute({List<PageRouteInfo>? children})
      : super(
          IntroRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

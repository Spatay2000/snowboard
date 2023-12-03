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
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
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
    PasswordResetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PasswordResetScreen(),
      );
    },
    PhoneNumberRegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<PhoneNumberRegistrationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PhoneNumberRegistrationScreen(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    RegistrationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegistrationScreen(),
      );
    },
    ScheduleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScheduleScreen(),
      );
    },
    VerificationRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerificationScreen(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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

/// generated route for
/// [PasswordResetScreen]
class PasswordResetRoute extends PageRouteInfo<void> {
  const PasswordResetRoute({List<PageRouteInfo>? children})
      : super(
          PasswordResetRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordResetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PhoneNumberRegistrationScreen]
class PhoneNumberRegistrationRoute
    extends PageRouteInfo<PhoneNumberRegistrationRouteArgs> {
  PhoneNumberRegistrationRoute({
    Key? key,
    required String userId,
    List<PageRouteInfo>? children,
  }) : super(
          PhoneNumberRegistrationRoute.name,
          args: PhoneNumberRegistrationRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'PhoneNumberRegistrationRoute';

  static const PageInfo<PhoneNumberRegistrationRouteArgs> page =
      PageInfo<PhoneNumberRegistrationRouteArgs>(name);
}

class PhoneNumberRegistrationRouteArgs {
  const PhoneNumberRegistrationRouteArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final String userId;

  @override
  String toString() {
    return 'PhoneNumberRegistrationRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegistrationScreen]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
      : super(
          RegistrationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScheduleScreen]
class ScheduleRoute extends PageRouteInfo<void> {
  const ScheduleRoute({List<PageRouteInfo>? children})
      : super(
          ScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerificationScreen]
class VerificationRoute extends PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({
    Key? key,
    required String userId,
    List<PageRouteInfo>? children,
  }) : super(
          VerificationRoute.name,
          args: VerificationRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const PageInfo<VerificationRouteArgs> page =
      PageInfo<VerificationRouteArgs>(name);
}

class VerificationRouteArgs {
  const VerificationRouteArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final String userId;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, userId: $userId}';
  }
}

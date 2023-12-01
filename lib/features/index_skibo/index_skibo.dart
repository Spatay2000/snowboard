import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snowboard/core/auto_route/app_router.dart';
import 'package:snowboard/core/get_it/configurator.dart';
import 'package:snowboard/features/common/skibo_color.dart';
import 'package:snowboard/features/index_skibo/bloc/index_skibo_bloc.dart';

@RoutePage()
class IndexSkiboTabBar extends StatefulWidget {
  const IndexSkiboTabBar({
    super.key,
    this.screenIndex = 0,
  });
  final int? screenIndex;

  @override
  State<IndexSkiboTabBar> createState() => _IndexSkiboTabBarState();
}

class _IndexSkiboTabBarState extends State<IndexSkiboTabBar> {
  final indexNavBloc = getIt<IndexSkiboBloc>();

  @override
  void initState() {
    super.initState();
    indexNavBloc.add(IndexSkiboChangedPage(index: widget.screenIndex!));
    log(widget.screenIndex.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        LoginRoute(),
        ScheduleRoute(),
        ProfileRoute(),
      ],
      backgroundColor: Colors.transparent,
      bottomNavigationBuilder: (context, tabsRouter) {
        return Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Container(
            color: SkiboColor.backgroundColorNavBar,
            child: Container(
              padding: const EdgeInsets.all(8).r,
              decoration: const BoxDecoration(
                color: SkiboColor.backgroundColorNavBar,
              ),
              child: SafeArea(
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: tabsRouter.activeIndex,
                  showSelectedLabels: true,
                  selectedLabelStyle: GoogleFonts.inter(
                      color: SkiboColor.activeColor,
                      fontWeight: FontWeight.w400),
                  unselectedLabelStyle: GoogleFonts.inter(
                      color: SkiboColor.passiveColor,
                      fontWeight: FontWeight.w400),
                  showUnselectedLabels: true,
                  useLegacyColorScheme: false,
                  elevation: 0,
                  fixedColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  selectedFontSize: 12.sp,
                  unselectedFontSize: 12.sp,
                  onTap: tabsRouter.setActiveIndex,
                  items: [
                    _customBottomNavigationBarItem(
                        'assets/svg/home.svg', 'Главная'),
                    _customBottomNavigationBarItem(
                        'assets/svg/basket.svg', 'Корзина'),
                    _customBottomNavigationBarItem(
                        'assets/svg/calendar.svg', 'Расписания'),
                    _customBottomNavigationBarItem(
                        'assets/svg/profile.svg', 'Профиль'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

BottomNavigationBarItem _customBottomNavigationBarItem(
    String icon, String label) {
  return BottomNavigationBarItem(
      label: label,
      activeIcon: SizedBox(
        height: 28.h,
        width: 28.w,
        child: SvgPicture.asset(
          icon,
          // ignore: deprecated_member_use
          color: SkiboColor.activeColor,
        ),
      ),
      icon: SizedBox(
        height: 28.h,
        width: 28.w,
        child: SvgPicture.asset(
          icon,
          // ignore: deprecated_member_use
          color: SkiboColor.passiveColor,
        ),
      ));
}

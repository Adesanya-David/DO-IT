import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:do_it/screens/add_project_page.dart';
import 'package:do_it/screens/homepage.dart';
import 'package:do_it/screens/profle_page.dart';
import 'package:do_it/screens/project_page.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../task_page.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = "/bottomNavbar";
  final int selectedIndex;
  const BottomNavBar({super.key, required this.selectedIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ProjectPage(),
    TaskPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    _currentIndex = widget.selectedIndex;
    super.initState();
  }

  final List<Map<String, String>> iconList = [
    {
      'active': 'assets/svgs/home_filled.svg',
      'inactive': 'assets/svgs/home.svg',
    },
    {
      'active': 'assets/svgs/project_filled.svg',
      'inactive': 'assets/svgs/project.svg',
    },
    {'active': 'assets/svgs/Icon.svg', 'inactive': 'assets/svgs/Icon.svg'},
    {
      'active': 'assets/svgs/profile.svg',
      'inactive': 'assets/svgs/profile.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              navigateToPageOutOfNavBar(context, AddProjectPage());
            });
          },
          backgroundColor: appColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const Icon(
              CupertinoIcons.add,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: Color.fromRGBO(243, 250, 255, 1),
        itemCount: iconList.length,
        height: 70,

        tabBuilder: (int index, bool isActive) {
          final iconPaths = iconList[index];
          final iconPath =
              isActive ? iconPaths['active']! : iconPaths['inactive']!;
          return SvgPicture.asset(
            iconPath,
            height: 24,
            width: 24,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              isActive
                  ? CustomColors.bottomActive()
                  : CustomColors.getTextColor(),
              BlendMode.srcIn,
            ),
          );
        },

        leftCornerRadius: 10,
        rightCornerRadius: 10,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

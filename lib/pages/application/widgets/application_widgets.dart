import 'package:elearn_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    const Center(child: Text("Search")),
    const Center(child: Text("Course")),
    const Center(child: Text("Chat")),
    const Center(child: Text("Profile"))
  ];

  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: "Home",
    icon: SizedBox(
      width: 18.w,
      height: 18.h,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      width: 18.w,
      height: 18.h,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Search",
    icon: SizedBox(
      width: 18.w,
      height: 18.h,
      child: Image.asset("assets/icons/search2.png"),
    ),
    activeIcon: SizedBox(
      width: 18.w,
      height: 18.h,
      child: Image.asset(
        "assets/icons/search2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Course",
    icon: SizedBox(
      width: 18.w,
      height: 18.h,
      child: Image.asset("assets/icons/play-circle1.png"),
    ),
    activeIcon: SizedBox(
      width: 18.w,
      height: 18.h,
      child: Image.asset(
        "assets/icons/play-circle1.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Chat",
    icon: SizedBox(
      width: 18.w,
      height: 18.h,
      child: Image.asset("assets/icons/message-circle.png"),
    ),
    activeIcon: SizedBox(
      width: 18.w,
      height: 18.h,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Profile",
    icon: SizedBox(
      width: 18.w,
      height: 18.h,
      child: Image.asset("assets/icons/person2.png"),
    ),
    activeIcon: SizedBox(
      width: 18.w,
      height: 18.h,
      child: Image.asset(
        "assets/icons/person2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
];

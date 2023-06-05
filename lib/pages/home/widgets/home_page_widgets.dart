import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      child: Row(
        children: [
          Container(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          )
        ],
      ),
    ),
  );
}

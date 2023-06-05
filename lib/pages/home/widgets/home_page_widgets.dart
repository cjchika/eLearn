import 'package:elearn_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/person.png"),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

// REUSABLE TEXT
Widget homePageText(String text,
    {Color? color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

// REUSABLE SEARCH BOX
Widget searchBox() {
  return Row(
    children: [
      Container(
        width: 300.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.h,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                // onChanged: (value)=> func!(value),
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Search for course",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintStyle: TextStyle(
                    color: AppColors.primaryFourElementText,
                  ),
                ),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      )
    ],
  );
}

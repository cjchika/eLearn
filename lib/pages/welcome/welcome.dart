import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearn_app/common/values/colors.dart';
import 'package:elearn_app/common/values/constant.dart';
import 'package:elearn_app/global.dart';
import 'package:elearn_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:elearn_app/pages/welcome/bloc/welcome_events.dart';
import 'package:elearn_app/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WelcomeState();
  }
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                        1,
                        context,
                        "Next",
                        "First See Learning",
                        "Forget about a for all paper all knowledge in one learning!",
                        "assets/images/reading.png"),
                    _page(
                        2,
                        context,
                        "Next",
                        "Connect with everyone",
                        "Always keep in touch with tutor & friend. Let's get connect!",
                        "assets/images/boy.png"),
                    _page(
                        3,
                        context,
                        "Get Started",
                        "Always Fascinated Learning",
                        "Anywhere, anytime. The time is at your discretion, so study whenever you want",
                        "assets/images/man.png"),
                  ],
                ),
                Positioned(
                    bottom: 70.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.primaryElement.withOpacity(0.5),
                        size: const Size.square(8.0),
                        activeColor: AppColors.primaryElement,
                        activeSize: const Size(16.0, 10.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ))
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _page(int index, BuildContext context, String buttonText, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 340.w,
          height: 340.h,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 370.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              //animation
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            } else {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => const MyHomePage(title: "Home")));
              Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              print("Global value ${Global.storageService.getDeviceFirstOpen()}");
              Navigator.of(context).pushNamedAndRemoveUntil('/sign_in', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 80.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.w),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1))
                ]),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
              ),
            ),
          ),
        )
      ],
    );
  }
}

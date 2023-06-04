import 'package:elearn_app/common/values/colors.dart';
import 'package:elearn_app/pages/application/bloc/app_blocs.dart';
import 'package:elearn_app/pages/application/bloc/app_events.dart';
import 'package:elearn_app/pages/application/bloc/app_states.dart';
import 'package:elearn_app/pages/application/widgets/application_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<StatefulWidget> createState() => _ApplicationPage();
}

class _ApplicationPage extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(builder: (context, state){
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
              body: buildPage(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration:
                BoxDecoration(color: AppColors.primaryElement, boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1
                  ),
                ]),
                child: BottomNavigationBar(
                    currentIndex: state.index,
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    selectedItemColor: AppColors.primaryElement,
                    unselectedItemColor: AppColors.primaryFourElementText,
                    onTap: (value) {
                      context.read<AppBlocs>().add(TriggerAppEvent(value));
                    },
                    items: [
                      BottomNavigationBarItem(
                        label: "Home",
                        icon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset("assets/icons/home.png"),
                        ),
                        activeIcon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                            "assets/icons/home.png",
                            color: AppColors.primaryElement,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Search",
                        icon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset("assets/icons/search2.png"),
                        ),
                        activeIcon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                            "assets/icons/search2.png",
                            color: AppColors.primaryElement,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Course",
                        icon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset("assets/icons/play-circle1.png"),
                        ),
                        activeIcon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                            "assets/icons/play-circle1.png",
                            color: AppColors.primaryElement,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Chat",
                        icon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset("assets/icons/message-circle.png"),
                        ),
                        activeIcon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                            "assets/icons/message-circle.png",
                            color: AppColors.primaryElement,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Profile",
                        icon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset("assets/icons/person2.png"),
                        ),
                        activeIcon: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                            "assets/icons/person2.png",
                            color: AppColors.primaryElement,
                          ),
                        ),
                      ),
                    ]),
              ),
            )),
      );
    });
  }
}

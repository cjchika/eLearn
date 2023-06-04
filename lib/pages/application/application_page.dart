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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(builder: (context, state) {
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
                    blurRadius: 1),
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
                items: bottomTabs,
              ),
            ),
          ),
        ),
      );
    });
  }
}

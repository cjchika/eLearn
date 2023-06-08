import 'package:elearn_app/common/values/colors.dart';
import 'package:elearn_app/pages/home/bloc/home_page_blocs.dart';
import 'package:flutter/material.dart';
import 'package:elearn_app/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/home_page_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBlocs, HomePageStates>(
        builder: (context, state){
          return Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homePageText("Hello", color: AppColors.primaryThreeElementText),
                homePageText("CJ Chika", top: 5),
                SizedBox(height: 20.h),
                searchBox(),
                sliderView(),
              ],
            ),
          );
        },
      ),
    );
  }
}

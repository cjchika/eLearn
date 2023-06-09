import 'package:elearn_app/pages/profile/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileStatePage();
}

class _ProfileStatePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: 6.h, bottom: 6.h),
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  image: const DecorationImage(
                      image: AssetImage("assets/icons/headpic.png")),
                ),
                child: Image(
                    width: 25.w,
                    height: 25.h,
                    image: const AssetImage("assets/icons/edit_3.png")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

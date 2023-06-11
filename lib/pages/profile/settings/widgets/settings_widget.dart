import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/widgets/basic_text_widget.dart';

AppBar buildAppBar() {
  return AppBar(
      title: Container(
    child: Container(
      child: reusableTextGlobal("Settings")
    ),
  ));
}

Widget settingsButton(BuildContext context, void Function()? triggerLogout){
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm logout"),
              content: const Text("Are you sure you want to logout?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: triggerLogout,
                  child: const Text("Confirm"),
                ),
              ],
            );
          });
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage("assets/icons/Logout.png"),
        ),
      ),
    ),
  );
}









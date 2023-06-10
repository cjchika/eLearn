import 'package:elearn_app/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:elearn_app/pages/profile/settings/widgets/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/settings_states.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(child:
          BlocBuilder<SettingsBlocs, SettingStates>(builder: (context, state) {
        return Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text("Confirm logout"),
                          content: Text("Are you sure you want to logout?"),
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
              ),
            ],
          ),
        );
      })),
    );
  }
}
